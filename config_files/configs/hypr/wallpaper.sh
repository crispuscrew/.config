#!/bin/bash

if [[ $# -lt 1 ]] || [[ ! -d $1   ]]; then
	echo "Usage:
	$0 <dir containing images>"
	exit 1
fi

export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION_STEP=100

INTERVAL=300

while true; do
	find "$1" -type f \
		| while read -r img; do
			echo "$((RANDOM % 1000)):$img"
		done \
		| sort -n | cut -d':' -f2- \
		| while read -r img; do
			swww img "$img" --transition-type wipe --transition-angle 30
			sleep $INTERVAL
		done
done
