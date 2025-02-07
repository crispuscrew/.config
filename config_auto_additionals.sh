#!/bin/bash
if [ "$(id -u)" -ne 0 ]; then
    echo "[ERR] This script must be run as root (sudo). Exiting."
    exit 1
fi


for i in 1; do
    echo "[INFO] Installing dnf packages..."
    dnf install -y flatpak jq curl fira-code-fonts
    if [ $? -ne 0 ]; then
        echo "[ERR] dnf packages installation finished with error, please repair it after script completion"
        break
    fi
    echo "[INFO] dnf packages install complete." 

    echo "[INFO] Setting up Flatpak remote..."
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    if [ $? -ne 0 ]; then
        echo "[ERR] Flatpak remote setup finished with error, please repair it after script completion"
        break
    fi
    echo "[INFO] Flatpak remote setup complete." 

    echo "[INFO] Installing Flatpak packages..."
    FlatpakPkgs=("com.spotify.Client" "io.qt.Linguist" "io.qt.Designer" "io.qt.QtCreator" "com.st.STM32CubeIDE" "org.telegram.desktop" "org.onlyoffice.desktopeditors" "com.discordapp.Discord")
    for pkg in "${FlatpakPkgs[@]}"; do
        flatpak install -y flathub "$pkg"
        if [ $? -ne 0 ]; then
            echo "[ERR] Installation of Flatpak package $pkg finished with error, please repair it after script completion"
            break
        fi
    done
done


echo "[INFO] Fetching the latest Amnezia VPN release..."
LATEST_RELEASE=$(curl -s https://api.github.com/repos/amnezia-vpn/amnezia-client/releases/latest | jq -r '.assets[] | select(.name | test("linux\\.tar\\.zip$")) | .browser_download_url')
if [ -z "$LATEST_RELEASE" ]; then
    echo "[ERR] Failed to fetch the latest release URL."
    exit 1
fi
echo "[INFO] Downloading Amnezia VPN..."
if wget "$LATEST_RELEASE"; then
    echo "[INFO] Amnezia VPN download complete."
else
    echo "[ERR] Amnezia VPN download finished with errors."
fi
echo "Please finish the installation manually."


echo "[INFO] Installing VS Code..."
rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
dnf install -y code
if [ $? -ne 0 ]; then
    echo "[ERR] VS Code installation finished with error, please repair it after script completion"
fi

echo "[INFO] Installing KiCad..."
dnf install -y kicad && echo "[INFO] KiCad install complete." || echo "[ERR] KiCad installation finished with error, please repair it after script completion"

echo "[INFO] After this, reboot your system."
echo "[INFO] Enjoy additional software."
