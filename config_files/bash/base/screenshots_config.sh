read -p "Want to configure screenshots path? (You can do this manually later) (y/n) (dflt: y): " answer
answer=${answer:-y}
while true; do
    case $answer in
        [Yy]* )
            read -p "Type screenshot path without / at the end (you can use ~ for your home directory) (dflt: ~/img/screenshot): " screenshot_path
            screenshot_path=${screenshot_path:-~/img/screenshot}
            screenshot_path="${screenshot_path/#\~/$user_home}"
            screenshot_path="${screenshot_path/\$HOME/$user_home}"
            if [ -d "$screenshot_path" ]; then
                echo "[INFO] Adding configuration for screenshot..."
            else
                screenshot_path=""
                echo "[ERR] Invalid screenshot path. Please configure it manually later."
            fi
            break
            ;;
        [Nn]* )
            screenshot_path=""
            break
            ;;
        * )
            echo "[ERR] Incorrect answer, try again."
            read -p "Want to configure screenshots path? (You can do this manually later) (y/n) (dflt: y): " answer
            answer=${answer:-y}
            continue
            ;;
    esac
done

sed -i "1i\\\$screenshot_path = '$screenshot_path'" "$user_home/.config/hypr/user.conf" \
&& echo "[INFO] screenshot_path install complete." || echo "[ERR] screenshot_path install finish with error, pls repair it after script completing"