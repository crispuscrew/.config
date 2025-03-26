echo "[INFO] Zero Tier installer download..."
curl -s https://install.zerotier.com | sudo bash
if [ $? -ne 0 ]; then
    echo "[ERR] Zero Tier installation finished with error, please repair it after script completion"
    exit -1
fi
