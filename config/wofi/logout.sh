#! /usr/bin/env bash

WOFI_CMD="${WOFI_CMD:-wofi --dmenu --conf $HOME/.config/wofi/config_logout}"

LOCK_SCREEN="󰌾 Lock Screen"
LOGOUT="󰍃 Logout     "
SHUTDOWN="󰐥 Power Off  "
REBOOT="󰁪 Reboot     "

chosen=$(echo -e "${LOCK_SCREEN}\n${LOGOUT}\n${SHUTDOWN}\n${REBOOT}" | $WOFI_CMD)

if [[ $chosen = "${LOGOUT}" ]]; then
	swaymsg exit
elif [[ $chosen = "${SHUTDOWN}" ]]; then
	systemctl poweroff
elif [[ $chosen = "${REBOOT}" ]]; then
	systemctl reboot
elif [[ $chosen = "${LOCK_SCREEN}" ]]; then
	swaylock -f -i ~/.config/wallpapers/wall_secondary.png
fi
