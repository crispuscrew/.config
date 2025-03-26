echo "[INFO] Any Type installer download..."

dnf install https://anytype-release.fra1.cdn.digitaloceanspaces.com/anytype-0.45.3.x86_64.rpm -y
if [ $? -ne 0 ]; then
    echo "[ERR] Any Type package installation finished with error, please repair it after script completion"
    exit -1
fi

echo "[INFO] Any Type install complete"
