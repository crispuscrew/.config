#!/bin/bash
if [ "$(id -u)" -ne 0 ]; then
    echo "[ERR] This script must be run as root (sudo). Exiting."
    exit 1
fi

export user_home=$(eval echo "~$SUDO_USER")

files=("add_dnf.sh" "add_flatpak.sh" "anytype_install.sh" \
       "chrome_install.sh" "cube_ide_install.sh" "kicad_install.sh" \
       "zerotier_install.sh" "vs_code_install.sh" "amnezia_install.sh")
files=("amnezia_install.sh" )
user_files=()
path_to_files=${user_home}/.config/config_files/bash/add/

for file in "${files[@]}"; do
    chmod +x ${path_to_files}${file}
    ${path_to_files}${file}
    if [ $? -ne 0 ]; then
        echo "[ERR] ${file} error"
    fi
done

echo "[INFO] After this, reboot your system."
echo "[INFO] Enjoy additional software."
exit 0