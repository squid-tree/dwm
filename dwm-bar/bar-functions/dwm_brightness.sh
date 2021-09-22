#!/bin/sh

dwm_brightness () {
	BRT=$(xrandr --verbose | grep Br | rev | cut -d " " -f1 | rev)
	printf "%s" "$SEP1"
	printf " %s" "$BRT"
	printf "%s" "$SEP1"
}

dwm_brightness
