echo "[INFO] Installing VS Code..."
rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
dnf install -y code
if [ $? -ne 0 ]; then
    echo "[ERR] VS Code installation finished with error, please repair it after script completion"
    exit -1
fi