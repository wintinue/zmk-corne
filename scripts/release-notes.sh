#!/usr/bin/env bash
set -euo pipefail

# Generate a release-notes entry from commits since the previous tag.
#
# Usage:
#   scripts/release-notes.sh              # prepend to CHANGELOG.md, patch bump
#   scripts/release-notes.sh 1.1.0        # explicit new version
#   scripts/release-notes.sh --dry-run    # print the entry without writing
#
# The header is built automatically:
#   ## [<new>](<repo>/compare/v<prev>...v<new>) (YYYY-MM-DD)
# Commit subjects are drafted into sections:
#   Add* -> Added, Fix* -> Fixed, everything else -> Changed.
# Empty sections are skipped when there are commits to classify.
#
# If HEAD itself is tagged (the CI case, running on a tag push), that tag
# is taken as the release version and the tag before it as the baseline.

cd "$(git rev-parse --show-toplevel)"

dry_run=false
new_version=""
for arg in "$@"; do
  case $arg in
    --dry-run) dry_run=true ;;
    *) new_version=${arg#v} ;;
  esac
done

repo_url=$(git remote get-url origin)
repo_url=${repo_url%.git}
repo_url=${repo_url/#http:\/\//https://}

head_tag=$(git tag --points-at HEAD --list 'v*' | sort -V | tail -1)
if [[ -n $head_tag ]]; then
  prev_tag=$(git describe --tags --abbrev=0 "$head_tag^" 2>/dev/null || true)
  [[ -z $new_version ]] && new_version=${head_tag#v}
else
  prev_tag=$(git describe --tags --abbrev=0 2>/dev/null || true)
fi

if [[ -z $new_version ]]; then
  IFS=. read -r major minor patch <<<"${prev_tag#v}"
  new_version="$major.$minor.$((patch + 1))"
fi

if [[ -n $prev_tag ]]; then
  header="## [$new_version]($repo_url/compare/$prev_tag...v$new_version)"
  range="$prev_tag..HEAD"
else
  header="## [$new_version]($repo_url/commits/v$new_version)"
  range="HEAD"
fi

today=$(date +%Y-%m-%d)

added=()
changed=()
fixed=()
while IFS= read -r subject; do
  case $subject in
    [Aa]dd*) added+=("- $subject") ;;
    [Ff]ix*) fixed+=("- $subject") ;;
    *) changed+=("- $subject") ;;
  esac
done < <(git log --reverse --format=%s "$range")
total=$((${#added[@]} + ${#changed[@]} + ${#fixed[@]}))

section() {
  local title=$1; shift
  local lines=("$@")
  # With no commits at all, keep empty placeholders for manual drafting.
  if ((${#lines[@]} == 0)) && ((total > 0)); then
    return
  fi
  echo "### $title:"
  if ((${#lines[@]})); then
    printf '%s\n' "${lines[@]}"
  else
    echo "- "
  fi
  echo
}

entry=$(
  echo "$header ($today)"
  echo
  section "Added" ${added[@]+"${added[@]}"}
  section "Changed" ${changed[@]+"${changed[@]}"}
  section "Fixed" ${fixed[@]+"${fixed[@]}"}
)

if $dry_run; then
  printf '%s\n' "$entry"
  exit 0
fi

changelog=CHANGELOG.md
tmp=$(mktemp)
{
  if [[ -f $changelog ]] && head -1 "$changelog" | grep -q '^# '; then
    head -1 "$changelog"
    echo
    printf '%s\n' "$entry"
    echo
    tail -n +2 "$changelog" | sed '/./,$!d'
  else
    echo "# Changelog"
    echo
    printf '%s\n' "$entry"
    if [[ -f $changelog ]]; then
      echo
      cat "$changelog"
    fi
  fi
} >"$tmp"
mv "$tmp" "$changelog"

echo "Added $new_version entry to $changelog."
