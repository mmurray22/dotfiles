#!/bin/bash

SELECTION="$(printf "1 - Lock\n2 - Suspend\n3 - Log out\n4 - Reboot\n5 - Reboot to UEFI\n6 - Hard reboot\n7 - Shutdown" | fuzzel --dmenu -l 7 -p "Power Menu: ")"

case $SELECTION in
	*"Lock") swaylock --image $HOME/.config/wallpaper/lock_screen.jpg --ring-color=9c2811 --key-hl-color=ba4e38 --text-color=ffffff --inside-color=000000dd;;
	*"Suspend")
		systemctl suspend;;
	*"Log out")
		hyprctl dispatch exit;;
	*"Reboot")
		systemctl reboot;;
	*"Reboot to UEFI")
		systemctl reboot --firmware-setup;;
	*"Hard reboot")
		pkexec "echo b > /proc/sysrq-trigger";;
	*"Shutdown")
		systemctl poweroff;;
esac
