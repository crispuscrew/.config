echo "[INFO] Amnezia VPN Installer starts..."


mkdir ${user_home}/.config/config_files/temp
curl -L -o ${user_home}/.config/config_files/temp/AmneziaVPN_4.8.5.0_linux.tar.zip https://github.com/amnezia-vpn/amnezia-client/releases/download/4.8.5.0/AmneziaVPN_4.8.5.0_linux.tar.zip
if [ $? -ne 0 ]; then
    echo "[ERR] Amnezia VPN downlaod finished with error, please repair it after script completion"
    exit -1
fi

unzip ${user_home}/.config/config_files/temp/AmneziaVPN_4.8.5.0_linux.tar.zip -d ${user_home}/.config/config_files/temp/
tar -xf ${user_home}/.config/config_files/temp/AmneziaVPN_Linux_Installer.tar -C ${user_home}/.config/config_files/temp/

echo "[INFO] If after this installation, the script doesn't stop automatically, press Ctrl+C"

su $SUDO_USER -c "/usr/bin/xhost +"

chmod a+rw ${user_home}/.config/config_files/temp/
chmod a+rw ${user_home}/.config/config_files/temp/*

chmod +x ${user_home}/.config/config_files/temp/AmneziaVPN_Linux_Installer.bin
${user_home}/.config/config_files/temp/AmneziaVPN_Linux_Installer.bin

if [ $? -ne 0 ]; then
    echo "[ERR] Amnezia VPN install with error, please repair it after script completion"
    rm -fr ${user_home}/.config/config_files/temp/AmneziaVPN_4.8.5.0_linux.tar.zip
    rm -fr ${user_home}/.config/config_files/temp/AmneziaVPN_Linux_Installer.tar
    exit -1
else
    rm -fr ${user_home}/.config/config_files/temp
    echo "[INFO] Amnezia VPN install complete"
fi

