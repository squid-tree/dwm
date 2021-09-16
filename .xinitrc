#!/bin/bash

# based off https://gist.github.com/pedrominicz/fb9f3e94d2acb9aba6f28fffd9867137

# invoke global X session script
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# (optional) set capslock to backspace
#setxkbmap -option caps:backspace &

# DWM Bar
~/dwm-bar/dwm_bar.sh &
 
# wallpaper
feh --bg-scale ~/wallpaper.png &

# xrandr [Customise for your needs]
xrandr --output DP-0 --primary --right-of HDMI-0 &

# picom

picom -b 

# dwm

exec dwm
