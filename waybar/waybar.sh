#!/bin/bash
# Kill and restart waybar whenever its config files change

CONFIG_FILES="$HOME/.config/waybar/config.jsonc $HOME/.config/waybar/style.css"

trap "killall waybar" EXIT
echo "Testing??"
while true; do
	echo "Started!"
	logger -i "$0: Starting waybar in the background..."
	waybar &
	echo "Waybar should be disaplayed!!"
	logger -i "$0: Started waybar PID=$!. Waiting for modifications to ${CONFIG_FILES}..."
	inotifywait -e modify ${CONFIG_FILES} 2>&1 | logger -i
	logger -i "$0: inotifywait returned $?. Killing all waybar processes..."
	echo "Killed all waybar"
	killall waybar 2>&1 | logger -i
	logger -i "$0: killall waybar returned $?, wait a sec..."
	sleep 1
	echo "Sleeping snoozeee"
done

