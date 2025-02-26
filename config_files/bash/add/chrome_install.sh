echo "[INFO] Google Chrome installer download..."
dnf install --repofrompath=google-chrome,https://dl.google.com/linux/chrome/rpm/stable/x86_64/ google-chrome-stable
if [ $? -ne 0 ]; then
    echo "[ERR] Google Chrome installation finished with error, please repair it after script completion"
    exit -1
fi
