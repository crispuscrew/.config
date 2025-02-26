echo "[INFO] Any Type installer download..."
mkdir ${user_home}/.config/config_files/temp
curl -o ${user_home}/.config/config_files/temp/anytype.x86_64.rpm https://anytype-release.fra1.cdn.digitaloceanspaces.com/anytype-0.45.3.x86_64.rpm
if [ $? -ne 0 ]; then
    echo "[ERR] Any Type downlaod finished with error, please repair it after script completion"
    exit -1
fi

dnf install ${user_home}/.config/config_files/temp/anytype.x86_64.rpm -y
if [ $? -ne 0 ]; then
    echo "[ERR] Any Type package installation finished with error, please repair it after script completion"
    exit -1
fi
rm -fr ${user_home}/.config/config_files/temp
echo "[INFO] Any Type install complete"
