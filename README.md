# **ZMK Firmware for Corne Keyboard (XIAO BLE)**

This repository contains a customized **[ZMK firmware](https://zmk.dev/docs)** for the **Corne split keyboard**(42 keys) powered by **[Seeed Studio XIAO BLE](https://wiki.seeedstudio.com/XIAO_BLE/)**. It includes a custom keymap, multiple layers, and Bluetooth multi-device support.

## **Features**
- 🛠 **Custom Keymap** optimized for efficiency and ergonomics.
- 🔄 **Multiple Layers**: macOS, Windows, Symbols, Numbers, System, and Mouse.
- 📡 **Bluetooth Multi-Device Support** for seamless switching between up to 5 devices.
- 🎭 **Tap & Hold Behavior** for dual-function keys.
- 🖱 **Mouse Layer** for cursor movement and scrolling.
- 🔄 **Firmware Reset & Bootloader Access** via dedicated keys and **one-handed combos**.

---

## **Getting Started**

### **1️⃣ Fork This Repository**

### **2️⃣ Customize Keyboard**
- Using GUI
  - [Keymap Editor](https://nickcoutsos.github.io/keymap-editor/)
- Edit code
  - Edit [`config/chipper.conf`](https://github.com/wintinue/zmk-corne/blob/custom/config/chipper.conf) to set your own keyboard
  - Edit [`config/chipper.keymap`](https://github.com/wintinue/zmk-corne/blob/custom/config/chipper.keymap) to set your own keymap

### **3️⃣ Build Firmware**
1. Click `Action` tab of your repository page.
2. Run `Build ZMK firmware` workflow.
3. Download firmware zip file.

### **4️⃣ Flash Firmware**
1. **Put XIAO BLE into bootloader mode** by double-tapping the [**RST** button](https://wiki.seeedstudio.com/XIAO_BLE/#hardware-overview).
2. Drag and drop the generated `.uf2` file into the mounted **bootloader drive**.


---

## **Keymap Overview**

### **Layer Structure**
| Layer | ID | Function |
|--------|----|----------------|
| **macOS** | `MAC 0` | Default macOS typing layer |
| **Windows** | `WIN 1` | Default Windows typing layer |
| **Symbols & Functions** | `SYM 2` | Special characters, function keys (F1-F12) |
| **Numbers & Navigation** | `NUM 3` | Number pad, navigation keys |
| **System** | `SYS 4` | Media controls, Bluetooth switching, bootloader, reset |
| **Mouse** | `PNT 5` | Mouse movement, scrolling |

---

### **Layer Details**

#### **1️⃣ macOS Layer (`MAC 0`)**
```
 ┌─────┬─────┬─────┬─────┬─────┬─────┐      ┌─────┬─────┬─────┬─────┬─────┬─────┐
 │ TAB │  Q  │  W  │  E  │  R  │  T  │      │  Y  │  U  │  I  │  O  │  P  │BSPC │
 ├─────┼─────┼─────┼─────┼─────┼─────┤      ├─────┼─────┼─────┼─────┼─────┼─────┤
 │CTRL │  A  │  S  │  D  │  F  │  G  │      │  H  │  J  │  K  │  L  │  ;  │CTRL │
 │ ESC │     │     │     │     │     │      │     │     │     │     │     │ '   │
 ├─────┼─────┼─────┼─────┼─────┼─────┤      ├─────┼─────┼─────┼─────┼─────┼─────┤
 │SFT  │  Z  │  X  │  C  │  V  │  B  │      │  N  │  M  │  ,  │  .  │  /  │SFT  │
 └─────┴─────┴─────┼─────┼─────┼─────┤      ├─────┼─────┼─────┼─────┴─────┴─────┘
                   │GUI  │SYM  │SPACE│      │RET  │NUM  │ALT  │
                   └─────┴─────┴─────┘      └─────┴─────┴─────┘
```
- Standard QWERTY layout with `Cmd` (`LGUI`) instead of `Ctrl`.
- **Left Ctrl (`LCTRL`) is dual-purpose**:
  - Tap → `Esc`
  - Hold → `LCTRL`

#### **2️⃣ Windows Layer (`WIN 1`)**
- Identical to macOS, but `Ctrl` and `Win` keys are swapped to match Windows shortcuts.

#### **3️⃣ Symbols & Functions (`SYM 2`)**
```
 ┌───────┬───────┬───────┬───────┬───────┬───────┐      ┌───────┬───────┬───────┬───────┬───────┬───────┐
 │  ~    │  !    │  @    │  #    │  $    │  %    │      │  ^    │  &    │  *    │  (    │  )    │TRANS  │
 ├───────┼───────┼───────┼───────┼───────┼───────┤      ├───────┼───────┼───────┼───────┼───────┼───────┤
 │ PNT   │  F1   │  F2   │  F3   │  F4   │  F5   │      │  F11  │  -    │  =    │  [    │  ]    │  |    │
 ├───────┼───────┼───────┼───────┼───────┼───────┤      ├───────┼───────┼───────┼───────┼───────┼───────┤
 │TRANS  │  F6   │  F7   │  F8   │  F9   │  F10  │      │  F12  │  _    │  +    │  {    │  }    │  \    │
 └───────┴───────┴───────┼───────┼───────┼───────┤      ├───────┼───────┼───────┼───────┴───────┴───────┘
                         │TRANS  │TRANS  │TRANS  │      │TRANS  │SYS    │TRANS  │
                         └───────┴───────┴───────┘      └───────┴───────┴───────┘
```
- **Function keys (`F1-F12`)**
- **Symbol characters** (`@ # $ % ^ & * ...`)

#### **4️⃣ Numbers & Navigation (`NUM 3`)**
```
 ┌───────┬───────┬───────┬───────┬───────┬───────┐      ┌───────┬───────┬───────┬───────┬───────┬───────┐
 │  `    │  1    │  2    │  3    │  4    │  5    │      │  6    │  7    │  8    │  9    │  0    │TRANS  │
 ├───────┼───────┼───────┼───────┼───────┼───────┤      ├───────┼───────┼───────┼───────┼───────┼───────┤
 │TRANS  │ CAPS  │ HOME  │ PGUP  │ DEL   │       │      │ LEFT  │ DOWN  │  UP   │RIGHT  │  |    │TRANS  │
 ├───────┼───────┼───────┼───────┼───────┼───────┤      ├───────┼───────┼───────┼───────┼───────┼───────┤
 │TRANS  │ PSCRN │ END   │ PGDN  │ INS   │       │      │       │       │TRANS  │TRANS  │  \    │TRANS  │
 └───────┴───────┴───────┼───────┼───────┼───────┤      ├───────┼───────┼───────┼───────┴───────┴───────┘
                         │TRANS  │SYS    │TRANS  │      │TRANS  │TRANS  │TRANS  │
                         └───────┴───────┴───────┘      └───────┴───────┴───────┘
```
- **Number keys (`1-0`)**
- **Navigation keys (`Home, End, PgUp, PgDn`)**
- **Arrow keys (`Left, Right, Up, Down`)**

#### **5️⃣ System (`SYS 4`)**
```
 ┌───────┬────────────┬───────┬──────────┬──────────┬───────┐      ┌───────┬───────┬───────┬───────┬───────┬────────┐
 │       │ Play/Pause │ Mute  │ Show Win │ Show App │       │      │       │MAC    │WIN    │       │       │ BT_CLR │
 ├───────┼────────────┼───────┼──────────┼──────────┼───────┤      ├───────┼───────┼───────┼───────┼───────┼────────┤
 │       │ Next       │ Vol+  │ Bright+  │ Search   │ Boot  │      │ Boot  │  BT0  │ BT1   │ BT2   │ BT3   │ BT4    │
 ├───────┼────────────┼───────┼──────────┼──────────┼───────┤      ├───────┼───────┼───────┼───────┼───────┼────────┤
 │       │ Prev       │ Vol-  │ Bright-  │          │ Reset │      │ Reset │       │ BT_PRV│ BT_NXT│       │        │
 └───────┴────────────┴───────┼──────────┼──────────┼───────┤      ├───────┼───────┼───────┼───────┴───────┴────────┘
                              │          │TRANS     │       │      │       │TRANS  │       │
                              └──────────┴──────────┴───────┘      └───────┴───────┴───────┘
```
- **Media controls** (`Play/Pause, Volume, Brightness`).
- **Bluetooth switching:**
  - `BT_SEL 0-4` → Switch to paired devices.
  - `BT_CLR` → Clear Bluetooth pairing.
  - `BT_PRV / BT_NXT` → Cycle through devices.
- **Firmware reset & bootloader mode:** see [Firmware Reset & Bootloader](#firmware-reset--bootloader) for the difference and one-handed combos.

#### **6️⃣ Mouse (`PNT 5`)**
```
 ┌───────┬───────┬───────┬───────┬───────┬───────┐      ┌───────┬───────┬───────┬─────────┬───────┬───────┐
 │       │       │       │       │       │       │      │ ScrL  │ ScrD  │ ScrU  │ ScrR    │       │       │
 ├───────┼───────┼───────┼───────┼───────┼───────┤      ├───────┼───────┼───────┼─────────┼───────┼───────┤
 │       │       │       │       │       │       │      │ Left  │ Down  │ Up    │ Right   │       │       │
 ├───────┼───────┼───────┼───────┼───────┼───────┤      ├───────┼───────┼───────┼─────────┼───────┼───────┤
 │       │       │       │       │       │       │      │ Back  │       │       │ Forward │       │       │
 └───────┴───────┴───────┼───────┼───────┼───────┤      ├───────┼───────┼───────┴─────────┴───────┴───────┘
                         │       │       │       │      │ LClick│ RClick│ MClick│
                         └───────┴───────┴───────┘      └───────┴───────┴───────┘

```
- **Mouse cursor movement (`MOVE_UP, MOVE_DOWN, MOVE_LEFT, MOVE_RIGHT`)**
- **Scrolling (`SCRL_UP, SCRL_DOWN, SCRL_LEFT, SCRL_RIGHT`)**
- **Mouse clicks (`LCLK, RCLK, MCLK`)**
- **Shortcut keys for browser navigation (`C_AC_BACK, C_AC_FORWARD`)**

---

## **Bluetooth Multi-Device Pairing**

XIAO BLE supports pairing with up to **5 devices**.

### **Pairing New Devices**
1. Activate the **SYS layer** using the assigned key.
2. Select a Bluetooth slot (`BT_SEL 0-4`).
3. Put the keyboard in pairing mode (`BT_CLR`).
4. Connect via your device’s Bluetooth settings.

### **Switching Between Devices**
Once paired, switch devices using:
- `&bt BT_SEL 0` → Device 1
- `&bt BT_SEL 1` → Device 2
- `&bt BT_SEL 2` → Device 3
- `&bt BT_SEL 3` → Device 4
- `&bt BT_SEL 4` → Device 5

---

## **Firmware Reset & Bootloader**

### **Reset vs. Bootloader**

| | `&sys_reset` (Reset) | `&bootloader` (Boot) |
|---|---|---|
| **What it does** | Soft reset — reboots the firmware | Enters bootloader (UF2 flashing mode) |
| **Right after** | Works as a keyboard again in a few seconds | Stops acting as a keyboard; mounts as a **USB drive** |
| **Use for** | Fixing temporary glitches (connection issues, freezes) | Flashing new firmware (`.uf2`) |
| **Recovery** | Automatic | Flash firmware or press the physical **RST** button |

In short: **Reset = reboot, Boot = firmware install mode.**

### **How to Trigger**

1. **One-handed combos** — press all 3 keys of a vertical column at once (base layers):

   | Half | Boot (outer column) | Reset (inner column) |
   |---|---|---|
   | **Left** | `Q + A + Z` | `T + G + B` |
   | **Right** | `P + ; + /` | `Y + H + N` |

2. **SYS layer keys** — activate `SYS` (after reset: `Space + P` or `Z`), then press the `Boot` / `Reset` key.
3. **Physical RST button** — double-tap (quickly, twice) the [**RST** button](https://wiki.seeedstudio.com/XIAO_BLE/#hardware-overview) to enter bootloader mode. Works on each half independently, even when pairing is broken.

> ⚠️ Combos and SYS-layer keys on the **right half only work while the halves are paired** — right-half key presses are processed by the left (central) half. If pairing is broken, the physical RST button is the only way in.

### **Re-pairing the Halves (settings_reset)**

If the two halves lose their pairing with each other:

1. **Flash `settings_reset` to BOTH halves** (one at a time): connect via USB → double-tap **RST** → copy `settings_reset-…-zmk.uf2` to the mounted drive. Doing only one half will fail — the other half still holds stale bonding info.
2. **Flash the normal firmware back**: `chipper_left.uf2` to the left, `chipper_right.uf2` to the right (same double-tap procedure).
3. **Power on both halves together**, close to each other — they pair automatically on first boot.
4. **Re-pair with your computer**: delete the old keyboard entry from the OS Bluetooth settings, then pair again.

All three `.uf2` files (`settings_reset`, `chipper_left`, `chipper_right`) are included in the GitHub Actions build artifact.

---

## **Contributing**
Feel free to submit **issues** or **pull requests** for improvements!

---

## **Credits**
Built using [ZMK Firmware](https://zmk.dev) and inspired by the [Corne Keyboard](https://github.com/foostan/crkbd).
