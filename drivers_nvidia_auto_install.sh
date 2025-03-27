if [ "$(id -u)" -ne 0 ]; then
    echo "[ERR] This script must be run as root (sudo). Exiting."
    exit 1
fi

echo "[INF] drivers nvidia install..."

dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
dnf install akmod-nvidia -y

if [ $? -ne 0 ]; then
    echo "[ERR] drivers nvidia install finished with error, please repair it after script completion"
    exit -1
fi

echo "[INF] drivers nvidia successful install"
read -p "Do you want to reboot the system? (y/N): " answer

case "$answer" in
    [Yy]* )
        echo "Rebooting system..."
        reboot 
        ;;
    * )
        echo "Reboot cancelled."
        ;;
esac

