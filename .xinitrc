#!/bin/bash

# Installed with install script from git repo

# based off https://gist.github.com/pedrominicz/fb9f3e94d2acb9aba6f28fffd9867137

# invoke global X session script
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# (optional) set capslock to backspace
setxkbmap -option caps:backspace 
setxkbmap -option lv3:ralt_switch

# DWM Bar
exec dwmstatus &

# wallpaper
feh --bg-scale ~/dwm/wallpaper.png 

# xrandr [Customise for your needs]
# xrandr --output DP-0 --primary --right-of HDMI-0 

nvidia-settings --load-config-only &

# Fcitx5
fcitx5 &
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS='@im=fcitx'

# dwm
exec dwm
