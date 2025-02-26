echo "[INFO] Installing KiCad..."
dnf install -y kicad && echo "[INFO] KiCad install complete." || echo "[ERR] KiCad installation finished with error, please repair it after script completion"
