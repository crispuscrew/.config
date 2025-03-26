echo "[INFO] Google Chrome installer download..."
dnf install fedora-workstation-repositories -y
dnf config-manager setopt google-chrome.enabled=1 -y
dnf install google-chrome-stable -y
if [ $? -ne 0 ]; then
    echo "[ERR] Google Chrome installation finished with error, please repair it after script completion"
    exit -1
fi
