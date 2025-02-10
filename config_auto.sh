if [ "$(id -u)" -ne 0 ]; then
    echo "[ERR] This script must be run as root (sudo). Exiting."
    exit 1
fi

user_home=$(eval echo "~$SUDO_USER")

echo "[INFO] dnf install..."

dnf install -y \
hyprland wayfire wlroots kitty mc wofi grim slurp waybar wl-copy wl-paste \
playerctl brightnessctl pactl xdotool libinput xbindkeys libva wlr-randr \
pavucontrol blueman swaylock \
&& echo "[INFO] dnf install complete." || echo "[ERR] dnf install finish with error, pls repair it after script completing"


echo "[INFO] Others bin install..."

if [ -d "./config_files/bin" ]; then
    cp ./config_files/bin/* /usr/bin/ \
    && echo "[INFO] Binary install complete." || echo "[ERR] Binary install finished with errors."
else
    echo "[ERR] Directory ./config_files/bin not found. Skipping binary installation."
fi


echo "[INFO] Configs install..."

if [ -d "./config_files/configs" ]; then
    cp -r ./config_files/configs/* ./ \
    && echo "[INFO] Configs install complete." || echo "[ERR] Configs install finished with errors."
else
    echo "[ERR] Directory ./config_files/configs not found. Skipping configs installation."
fi


echo "[INFO] Monitor setup:"

if [ ! -d "/sys/class/drm" ]; then
    echo "[ERR] /sys/class/drm not found. Ensure DRM is supported by your kernel."
    exit 1
fi

total_width=0
for device in /sys/class/drm/*-*/status; do
    if [ "$(cat "$device")" != "connected" ]; then
        continue
    fi
    name=$(basename "$(dirname "$device")")
    modes_file="$(dirname "$device")/modes"

    if [ -f "$modes_file" ]; then
        max_mode=$(cat "$modes_file" | sort -V | tail -n 1)
        echo "[INFO] Monitor detected: $name"
        echo "[INFO] Max mode: $max_mode"

        width=$(echo "$max_mode" | cut -d'x' -f1)
    else
        echo "[ERR] Monitor $name has no modes file. You must edit hypr/hyprland.config manually to configure this monitor later."
        continue
    fi

    read -p "Is this correct? y/n: " answer
    while true; do
        case $answer in
            [Yy]* )
                read -p "Insert monitor scale (example, 2.0): " scale
                if [[ ! "$scale" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
                    echo "[ERR] Incorrect scale, try again"
                    continue
                fi

                echo "[INFO] Adding configuration for $name..."
                sed -i "1i monitor = $name, $max_mode, ${total_width}x0, $scale" hypr/hyprland.conf
                total_width=$((total_width + width))
                break
                ;;
            [Nn]* )
                echo "[INFO] You must edit hypr/hyprland.config manually to configure this monitor later."
                break
                ;;
            * )
                echo "[ERR] Incorrect answer, try again."
                continue
                ;;
        esac
    done
done

echo "[INFO] Monitor setup complete"


echo "[INFO] Don't forget install drivers for your GPU for correct system works"

echo '[INFO] After this, reboot your system, log in with TTY and type "Hyprland"'

read -p "Want to configure wallpapers path? (You can do this manually later) y/n: " answer
while true; do
    case $answer in
        [Yy]* )
            read -p "Type wallpaper path without / at the end (you can use ~ for your home directory): " wallpaper_path
            wallpaper_path="${wallpaper_path/#\~/$user_home}"
            wallpaper_path="${wallpaper_path/\$HOME/$user_home}"
            if [ -d "$wallpaper_path" ]; then
                echo "[INFO] Adding configuration for wallpaper..."
                sed -i "1i \$wallpaper_path = '$wallpaper_path'" hypr/hyprland.conf
            else
                echo "[ERR] Invalid wallpaper path. Please configure it manually later."
            fi
            break
            ;;
        [Nn]* )
            break
            ;;
        * )
            echo "[ERR] Incorrect answer, try again."
            continue
            ;;
    esac
done


read -p "Want to configure screenshots path? (You can do this manually later) y/n: " answer
while true; do
    case $answer in
        [Yy]* )
            read -p "Type screenshots path without / at the end (you can use ~ for your home directory): " screenshots_path
            screenshots_path="${screenshots_path/#\~/$user_home}"
            screenshots_path="${screenshots_path/\$HOME/$user_home}"
            if [ -d "$screenshots_path" ]; then
                echo "[INFO] Adding configuration for screenshots..."
                sed -i "1i \$screenshot_path = '$screenshots_path'" hypr/hyprland.conf
            else
                echo "[ERR] Invalid screenshots path. Please configure it manually later."
            fi
            break
            ;;
        [Nn]* )
            break
            ;;
        * )
            echo "[ERR] Incorrect answer, try again."
            continue
            ;;
    esac
done

echo "[INFO] Enjoy your new beautiful system"

