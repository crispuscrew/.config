echo "[INFO] Setting up Flatpak remote..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
if [ $? -ne 0 ]; then
    echo "[ERR] Flatpak remote setup finished with error, please repair it after script completion"
    exit -1
fi
echo "[INFO] Flatpak remote setup complete." 

echo "[INFO] Installing Flatpak packages..."
FlatpakPkgs=("com.spotify.Client" "io.qt.Linguist" "io.qt.Designer" "io.qt.QtCreator" "org.telegram.desktop" "org.onlyoffice.desktopeditors" "com.discordapp.Discord")
for pkg in "${FlatpakPkgs[@]}"; do
    flatpak install -y flathub "$pkg"
    if [ $? -ne 0 ]; then
        echo "[ERR] Installation of Flatpak package $pkg finished with error, please repair it after script completion"
    fi
done