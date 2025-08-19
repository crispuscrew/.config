echo "[INFO] dnf copr  install..."

dnf install dnf-plugins-core -y
dnf copr enable elxreno/jetbrains-mono-fonts -y \
&& echo "[INFO] dnf copr install complete." || echo "[ERR] dnf copr install finish with error, pls repair it after script completing"

echo "[INFO] dnf install..."

dnf install -y \
hyprland wayfire wlroots foot mc wofi grim slurp waybar wl-copy wl-paste \
playerctl brightnessctl pactl xdotool libinput xbindkeys libva wlr-randr \
pavucontrol blueman swaylock jetbrains-mono-fonts pulseaudio-utils xhost\
&& echo "[INFO] dnf install complete." || echo "[ERR] dnf install finish with error, pls repair it after script completing"
