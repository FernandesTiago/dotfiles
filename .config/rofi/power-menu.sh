#!/bin/bash

chosen=$(echo -e "⏻ Desligar\n Reiniciar\n Suspender\n Bloquear\n Sair" | rofi -dmenu -p "Power" -theme /usr/share/rofi/themes/Arc-Dark.rasi)

case "$chosen" in
    "⏻ Desligar") systemctl poweroff ;;
    " Reiniciar") systemctl reboot ;;
    " Suspender") systemctl suspend ;;
    " Bloquear") betterlockscreen -l dim ;;
    " Sair") i3-msg exit ;;
esac
