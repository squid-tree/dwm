#!/bin/sh

# Based off https://github.com/joestandring/dwm-bar/blob/master/bar-functions/dwm_battery.sh

dwm_battery () { 
	
	CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
	STATUS=$(cat cat /sys/class/power_supply/BAT0/status)
	
	printf "%s" "$SEP1"
	if [ "$STATUS" = "Charging" ]; then
		if [ "$CHARGE" -ge 80]; then
			printf " %s%%" "$CHARGE"
		else
			printf " %s%%" "$CHARGE"
		fi
	else
		if [ "$CHARGE" -ge 90 ]; then
			printf " %s%%" "$CHARGE"
	else
		if [ "$CHARGE" -ge 75 ] && [ "$CHARGE" -lt 90 ]; then 
			printf " %s%%" "$CHARGE"
	else
		if [ "$CHARGE" -ge 25 ] && [ "$CHARGE" -lt 75 ]; then
			printf " %s%%" "$CHARGE"
	else
		if [ "$CHARGE" -gt 10 ] && [ "$CHARGE" -lt 25]; then
			printf " %s%%" "$CHARGE"    	
	else
		printf " %s%%" "$CHARGE"
	fi
	
	printf "%s\n" "$SEP2"
}

dwm_battery

		
