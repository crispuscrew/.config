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

    read -p "Is this correct? (y/n) (dflt: y): " answer
    answer=${answer:-y}
    while true; do
        case $answer in
            [Yy]* )
                read -p "Insert monitor scale (example, 2.0) (dflt: 1.0): " scale
                scale=${scale:-1.0}
                if [[ ! "$scale" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
                    echo "[ERR] Incorrect scale, try again"
                    read -p "Is this correct? (y/n) (dflt: y): " answer
                    answer=${answer:-y}
                    continue
                fi

                echo "[INFO] Adding configuration for $name..."

                printf "\$monitor= $name, $max_mode, ${total_width}x0, $scale\n" | cat - "$user_home/.config/hypr/user.conf" > "$user_home/.config/hypr/user.conf.tmp" \
                && mv "$user_home/.config/hypr/user.conf.tmp" "$user_home/.config/hypr/user.conf"

                total_width=$((total_width + width))
                break
                ;;
            [Nn]* )
                echo "[INFO] You must edit hypr/hyprland.config manually to configure this monitor later."
                break
                ;;
            * )
                echo "[ERR] Incorrect answer, try again."
                read -p "Is this correct? (y/n) (dflt: y): " answer
                answer=${answer:-y}
                continue
                ;;
        esac
    done
done

echo "[INFO] Monitor setup complete"
echo "[INFO] Don't forget install drivers for your GPU for correct system works"
echo '[INFO] After doing this, reboot your system, log in with TTY and type "Hyprland"'
