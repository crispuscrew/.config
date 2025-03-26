echo "[INFO] Rust Desk Installer starts..."

dnf install -y https://github.com/rustdesk/rustdesk/releases/download/1.3.8/rustdesk-1.3.8-0.x86_64.rpm
if [ $? -ne 0 ]; then
    echo "[ERR] Rust Desk install finished with error, please repair it after script completion"
    exit -1
fi

echo "[INFO] Rust Desk install complete"
