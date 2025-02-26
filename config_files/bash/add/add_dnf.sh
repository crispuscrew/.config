echo "[INFO] Installing dnf packages..."
dnf install -y flatpak jq curl speedcrunch gnome-keyring libsecret-* qemu-system-arm libvirt virt-manager ${user_home}/.config/config_files/add_pkg/anytype-0.45.3.x86_64.rpm
if [ $? -ne 0 ]; then
    echo "[ERR] dnf packages installation finished with error, please repair it after script completion"
    exit -1
fi
echo "[INFO] dnf packages install complete." 