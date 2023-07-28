#!/bin/bash

nitrogen --restore &
dwmblocks &
dunst &
redshift-gtk -l 51:0 &
picom -b &
nm-applet &
setxkbmap -layout gb -option caps:ctrl_modifier; xcape -e '#66=Escape'
~/dwm/low-battery-warning.sh 10 120 &
earlyoom -r 3600 -n --avoid '(^|/)(init|systemd.*|Xorg|sshd)$' &
systembus-notify &
unclutter &
xidlehook --timer 900 "xset dpms force off" "" --timer 10 "systemctl suspend" "" &
