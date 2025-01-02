#!/bin/bash

# Проверяем, запущен ли Waybar
if pgrep -x "waybar" > /dev/null; then
    # Если Waybar запущен, останавливаем его
    pkill waybar
else
    # Если Waybar не запущен, запускаем его
    waybar &
fi
