#!/bin/bash

dev_find () {
	QERD=$(xrandr -q | grep " connected" | cut -d " " -f1)
	printf "%s" "$QERD"
}	

brt_find () {
	QERB=$(xrandr --verbose | grep Br | rev | cut -d " " -f1 | rev)
	INC=0.1
	if [ "$1" = "-u" ]; then
		printf "$(echo "$QERB + $INC" | bc )"
	elif [ "$1" = "-d" ]; then
		printf "$(echo "$QERB - $INC" | bc )"
	fi
}

if [ "$1" = "-u" ] || [ "$1" = "-d" ]; then
	xrandr --output $(dev_find) --brightness $(brt_find $1)
else
	printf "Usage: brt.sh [paramater]"
fi
