echo "[INFO] Others bin install..."

if [ -d "$user_home/.config/config_files/bin" ]; then
    cp $user_home/.config/config_files/bin/* /usr/bin/ \
    && echo "[INFO] Binary install complete." || echo "[ERR] Binary install finished with errors."
else
    echo "[ERR] Directory ./config_files/bin not found. Skipping binary installation."
fi


echo "[INFO] Configs install..."

if [ -d "$user_home/.config/config_files/configs" ]; then
    cp -r $user_home/.config/config_files/configs/* $user_home/.config/ \
    && echo "[INFO] Configs install complete." || echo "[ERR] Configs install finished with errors."
else
    echo "[ERR] Directory ./config_files/configs not found. Skipping configs installation."
fi