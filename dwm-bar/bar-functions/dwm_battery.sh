#!/bin/sh

# Based off https://github.com/joestandring/dwm-bar/blob/master/bar-functions/dwm_battery.sh

dwm_battery () { 
	CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
	STATUS=$(cat /sys/class/power_supply/BAT0/status)
	printf "%s" "$SEP1"
	if [ "$STATUS" = "Charging" ]; then
		if [ "$CHARGE" -ge 80 ]; then
			printf " %s%%" "$CHARGE"
		else
			printf " %s%%" "$CHARGE"
		fi
	else
		if [ "$CHARGE" -ge 90 ]; then
			printf " %s%%" "$CHARGE"
		elif [ "$CHARGE" -gt 60 ] && [ "$CHARGE" -lt 90 ]; then 
			printf " %s%%" "$CHARGE"
		elif [ "$CHARGE" -ge 40 ] && [ "$CHARGE" -le 60 ]; then
			printf " %s%%" "$CHARGE"
		
		elif [ "$CHARGE" -gt 10 ] && [ "$CHARGE" -lt 40 ]; then
			printf " %s%%" "$CHARGE" 	
		else
			printf " %s%%" "$CHARGE"
		fi
	fi
	printf "%s\n" "$SEP2"
}

dwm_battery		
