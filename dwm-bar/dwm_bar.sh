#!/bin/sh

# A modular status bar for dwm
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: xorg-xsetroot

# Import functions with "$include /route/to/module"
# It is recommended that you place functions in the subdirectory ./bar-functions and use: . "$DIR/bar-functions/dwm_example.sh"

# Store the directory the script is running from
LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

# Change the appearance of the module identifier. if this is set to "unicode", then symbols will be used as identifiers instead of text. E.g. [📪 0] instead of [MAIL 0].
# Requires a font with adequate unicode character support
export IDENTIFIER="unicode"

# Change the charachter(s) used to seperate modules. If two are used, they will be placed at the start and end.
export SEP1=" "
export SEP2=" "
export SEP3="|"
# Import the modules
. "$DIR/bar-functions/dwm_battery.sh"
. "$DIR/bar-functions/dwm_pulse.sh"
. "$DIR/bar-functions/dwm_brightness.sh"
#parallelize() {
#    while true
#    do
#        printf "Running parallel processes\n"
#        dwm_weather &
#        dwm_networkmanager &
#        sleep 5
#    done
#}
#parallelize & 

# Update dwm status bar every second
while true
do
    # Append results of each func one by one to the upperbar string
    #upperbar="$upperbar$(dwm_pulse)"
   
    # Append results of each func one by one to the lowerbar string
    #lowerbar=""

    
    xsetroot -name "$(dwm_battery)$(dwm_pulse)$(date +" %a %d/%m/%y %H:%M")"
    
    # Uncomment the line below to enable the lowerbar 
#    xsetroot -name "$upperbar;$lowerbar"
    sleep 0.2
done
