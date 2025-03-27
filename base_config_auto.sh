if [ "$(id -u)" -ne 0 ]; then
    echo "[ERR] This script must be run as root (sudo). Exiting."
    exit 1
fi

export user_home=$(eval echo "~$SUDO_USER")

files=("base_dnf.sh" "files_install.sh" "selinux_disabled.sh")
user_files=("monitor_setup.sh" "wallpaper_config.sh" "screenshots_config.sh")
path_to_files=${user_home}/.config/config_files/bash/base/

for file in "${files[@]}"; do
    chmod +x ${path_to_files}${file}
    ${path_to_files}${file}
    if [ $? -ne 0 ]; then
        echo "[ERR] ${file} error"
    fi
done

user_conf_flag=true
if [ -e "${user_home}/.config//hypr/user.conf" ]; then
    read -p "It seems your hypr/user.conf already exists. Do you want to overwrite it? (y/n) (dflt: n)" answer
    answer=${answer:-n}
    while true; do
        case $answer in
            [Yy]* )
                break
                ;;
            [Nn]* )
                user_conf_flag=false
                break
                ;;
            * )
                echo "[ERR] Incorrect answer, try again."
                read -p "It seems your hypr/user.conf already exists. Do you want to overwrite it? (y/n) (dflt: n)" answer
                answer=${answer:-n}
                continue
                ;;
        esac
    done
fi
# echo "[DEBUG] Final user_conf_flag: $user_conf_flag"

chmod a+rw $user_home/.config/hypr/input.conf
if [ "$user_conf_flag" = true ]; then
    rm -f "$user_home/.config/hypr/user.conf" 
    touch "$user_home/.config/hypr/user.conf"
    chmod a+rw $user_home/.config/hypr/user.conf
    for file in "${user_files[@]}"; do
        chmod +x ${path_to_files}${file}
        ${path_to_files}${file}
        if [ $? -ne 0 ]; then
            echo "[ERR] ${file} error"
        fi
    done
    chmod a+rw $user_home/.config/hypr/user.conf
fi

echo "[INF] Enjoy your new beautiful system"
exit 0


