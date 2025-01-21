# Description

This is auto-install .config for **Fedora 41** with Hyprland (Wayland), Waybar, and additional utilities for enhanced desktop experience.

# Install Guide

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

You're always can change it in ~/.config/hypr/hyprland.conf
(super = $mainMod = Windows button = ⌘ Command)

### Main hotkeys

| Hotkey         | Action                     |
|----------------|----------------------------|
| super + C      | close focus window         |
| super + Q      | open terminal              |
| super + R      | open apps select menu      |
| super + V      | win+V equivalent           |
| super + S      | win + shift + s equivalent |
| super + L      | win + L equivalent         |
| super + arrows | toggle focus               |
| super + LMB   | move window            |
| super + RMB   | resize window          |

### Workspaces

| Hotkey                | Action                                   |
|-----------------------|------------------------------------------|
| super + (1-9)         | switch workspace (1-9)                   |
| super + (1-9) + shift | bring focus window to (1-9) workspace    |
| super + A             | back to previous workspace               |
| super + mouse scroll  | scroll workspaces                        |
| super + E             | switch to overflow workspace             |
| super + shift + E     | bring focus window to overflow workspace |
| super + D             | win + D equivalent                       |


### Additional hotkeys

| Hotkey      | Action                    |
|-------------|---------------------------|
| super + M   | close Hyprland session    |
| super + F11 | fullscreen focus window   |
| super + Tab | alt + Tab equivalent      |
| super + P   | pseudotile window         |
| super + J   | toggle split orientation  |
| super + W   | toggle waybar             |
| printscreen | screenshot save like file |
| super + F   | open file manager         |
| super + [   | wallpapers carousel on    |
| super + ]   | wallpapers off            |


# P.S

- U can click and double click to waybar icons for some things (just try)

- U can use multimedia (XF86) buttons for volume, media and screen control

- in *waybar/config*, if necessary, uncomment and complete the following line:
```json
//"interface": "paste-your-interface-here",
```

# P.P.S.

If you have any suggestions for improvements and/or adding something new to this repository, please feel free to fork it or message me on Telegram: https://t.me/gabzetdinov