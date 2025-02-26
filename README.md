# Description

This is auto-install .config for **Fedora 41** with Hyprland (Wayland), Waybar, and additional utilities for enhanced desktop experience.

# Install Guide

### If you install it over existing graphical environment

I don't know what effect this script will have on your system if you run it on an existing graphical environment other than Hyprland, like GNOME or KDE. I highly recommend performing a

### Pure installation

1. Download actual version of [**Fedora Server Network Install iso**](https://fedoraproject.org/server/download)

2. Create a bootable USB drive by, for example, **dd** comand (Linux) or [**Rufus**](https://rufus.ie/) (Windows)

3. Using your USB, install Fedora Workstation only with network drives (u maybe must use anaconda repo (https://repo.anaconda.com/pkgs))

4. After completing the system installation, log in with TTY and install git package by:
```bash
sudo dnf install git -y
```

5. Next, you download this repo:
```bash
git clone https://github.com/CrispusCrew/.config.git
```

6. And start bash script
```bash
cd .config
sudo chmod +x config_auto.sh
sudo ./config_auto.sh
```

7. You must install your GPU drivers by yourself, otherwise wayland-session may crash. If u have nvidia GPU, in my expirience, best way to get it - by RPM Fusion. For it:
```bash
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install akmod-nvidia
sudo reboot
```

8. Reboot your pc/laptop. Log in by TTY (press Ctrl+Alt+F2 if necessary), and write
```bash
Hyprland
```

# Enjoy
Your system is now configured with Hyprland and customized utilities. Explore and enjoy your beautiful new Linux desktop experience!

# Hotkeys

You're always can change it in ~/.config/hypr/input.conf

(Super = Super_L = $mainMod = Windows button = ⌘ Command)

### Main hotkeys

| Hotkey         | Action                     |
|----------------|----------------------------|
| Super + C      | close focus window         |
| Super + Q      | open terminal              |
| Super + R      | open apps select menu      |
| Super + V      | win+V equivalent           |
| Super + S      | win + shift + s equivalent |
| Super + L      | win + L equivalent         |
| Super + arrows | toggle focus               |
| Super + LMB    | move window                |
| Super + RMB    | resize window              |
| Super + U      | resize window by arrows, leave with esc    |

### Workspaces

| Hotkey                | Action                                   |
|-----------------------|------------------------------------------|
| Super + (1-9)         | switch workspace (1-9)                   |
| Super + (1-9) + shift | bring focus window to (1-9) workspace    |
| Super + A             | back to previous workspace               |
| Super + mouse scroll  | scroll workspaces                        |
| Super + E             | switch to overflow workspace             |
| Super + shift + E     | bring focus window to overflow workspace |
| Super + D             | win + D equivalent                       |

### Media, mic & screen
You also can use media (XF86) button
(multi-modificator hotheys are some unstable)

| Hotkey                | Action                             |
|-----------------------|------------------------------------|
| Super + Shift + B     | Increase screen brightness by 10%  |
| Super + Ctrl + B      | Decrease screen brightness by 10%  |
| Super + M             | Mute sound                         |
| Super + Shift + M     | Mute microphone                    |
| Super + Shift + Space | Play/Pause                         |
| Super + Shift + →     | Next track                         |
| Super + Shift + ←     | Previous track                     |
| Super + Shift + ↓     | Decrease volume by 5%              |
| Super + Shift + ↑     | Increase volume by 5%              |


### Additional hotkeys

| Hotkey      | Action                    |
|-------------|---------------------------|
| Super + F11 | fullscreen focus window   |
| Super + Tab | alt + Tab equivalent      |
| Super + P   | pseudotile window         |
| Super + J   | toggle split orientation  |
| Super + W   | toggle waybar             |
| printscreen | screenshot save like file |
| Super + F   | open file manager         |
| Super + [   | wallpapers carousel on    |
| Super + ]   | wallpapers off            |
| Super + U   | arrow to window resize mod, esc to leave           |

# Additional installation

If you want to install additional applications according to my preferences, run (under Hyprland session):

```bash
sudo ~/.config/.additionals_config_auto.sh
```

U may need to reboot

# P.S

- U can click and double click to waybar icons for some things (just try)

- U can use multimedia (XF86) buttons for volume, media and screen control

- in *waybar/config*, if necessary, uncomment and complete the following line:
```json
//"interface": "paste-your-interface-here",
```

# P.P.S.

If you have any suggestions for improvements and/or adding something new to this repository, please feel free to fork it or message me on Telegram: https://t.me/gabzetdinov