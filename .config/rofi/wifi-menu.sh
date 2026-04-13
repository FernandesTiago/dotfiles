#!/bin/bash

# Get current connection
current=$(iwgetid -r 2>/dev/null)

# Scan and list available networks
networks=$(nmcli -t -f SSID,SIGNAL,SECURITY dev wifi list | grep -v "^$" | sort -t: -k2 -nr | awk -F: '!seen[$1]++ && $1!=""')

# Build menu
menu=""
while IFS=: read -r ssid signal security; do
    if [ "$ssid" = "$current" ]; then
        menu+="* $ssid ($signal% $security)\n"
    else
        menu+="  $ssid ($signal% $security)\n"
    fi
done <<< "$networks"

# Add options
menu+="  Rescan\n  Disconnect"

# Show rofi
chosen=$(echo -e "$menu" | rofi -dmenu -p "Wi-Fi" -theme /usr/share/rofi/themes/Arc-Dark.rasi)

# Handle choice
case "$chosen" in
    *"Rescan")
        nmcli dev wifi rescan
        exec "$0"
        ;;
    *"Disconnect")
        nmcli dev disconnect wlo1
        notify-send "Wi-Fi" "Disconnected"
        ;;
    *)
        ssid=$(echo "$chosen" | sed 's/^[* ] //' | sed 's/ (.*//')
        if [ -z "$ssid" ]; then
            exit 0
        fi
        # Check if already known
        if nmcli -t -f NAME con show | grep -qx "$ssid"; then
            nmcli con up "$ssid"
        else
            # Ask for password
            password=$(rofi -dmenu -p "Password for $ssid" -password -theme /usr/share/rofi/themes/Arc-Dark.rasi)
            if [ -n "$password" ]; then
                nmcli dev wifi connect "$ssid" password "$password"
            fi
        fi
        # Notify result
        if [ $? -eq 0 ]; then
            notify-send "Wi-Fi" "Connected to $ssid"
        else
            notify-send "Wi-Fi" "Failed to connect to $ssid"
        fi
        ;;
esac
