read -p "Want to configure wallpapers path? (You can do this manually later) (y/n) (dflt: y): " answer
answer=${answer:-y}
while true; do
    case $answer in
        [Yy]* )
            read -p "Type wallpaper path without / at the end (you can use ~ for your home directory) (dflt: ~/img/wallpaper): " wallpaper_path
            wallpaper_path=${wallpaper_path:-$user_home/img/wallpaper/Flanker}
            wallpaper_path="${wallpaper_path/#\~/$user_home}"
            wallpaper_path="${wallpaper_path/\$HOME/$user_home}"
            if [ -d "$wallpaper_path" ]; then
                echo "[INFO] Adding configuration for wallpaper..."
            else
                wallpaper_path="$user_home/img/wallpaper"
                echo "[ERR] Invalid wallpaper path. Please configure it manually later."
            fi
            break
            ;;
        [Nn]* )
            wallpaper_path="$user_home/img/wallpaper"
            break
            ;;
        * )
            echo "[ERR] Incorrect answer, try again."
            read -p "Want to configure wallpapers path? (You can do this manually later) (y/n) (dflt: y): " answer
            answer=${answer:-y}
            continue
            ;;
    esac
done

printf "\$wallpaper_path = '%s'\n" "$wallpaper_path" | cat - "$user_home/.config/hypr/user.conf" > "$user_home/.config/hypr/user.conf.tmp" \
&& mv "$user_home/.config/hypr/user.conf.tmp" "$user_home/.config/hypr/user.conf" \
&& echo "[INFO] wallpaper_path install complete." || echo "[ERR] wallpaper_path install finish with error, pls repair it after script completing"