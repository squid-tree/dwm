#!/bin/sh

# A dwm_bar function to show the master volume of PulseAudio
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: pamixer

dwm_pulse () {
    VOL=$(pamixer --get-volume)
    MUT=$(pamixer --get-mute) 
    printf "%s" "$SEP1"
        if [ "$MUT" = "true" ]; then
            printf " MT "
        elif [ "$VOL" = 0 ]; then
            printf " 0%% "
        elif [ "$VOL" -ge 10 ] && [ "$VOL" -le 33 ]; then
            printf " %s%%" "$VOL"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -lt 10 ]; then
            printf " %s%% " "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf " %s%%" "$VOL"
        else
            printf " %s%%" "$VOL"
        fi
    printf "%s" "$SEP2"
    printf "%s" "$SEP3"
}

dwm_pulse
