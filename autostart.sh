#!/bin/bash

nitrogen --restore &
dwmblocks &
dunst &
redshift-gtk -l 51:0 &
picom -b &
nm-applet &
setxkbmap -option caps:ctrl_modifier; xcape -e '#66=Escape'
~/dwm/low-battery-warning.sh 10 120 &
earlyoom -r 3600 -n --avoid '(^|/)(init|systemd.*|Xorg|sshd)$' &
systembus-notify &
unclutter &
#easyeffects --gapplication-service &
xset dpms 0 0 300
xidlehook --not-when-audio --timer 600 "xset dpms force standby" "" --timer 10 "systemctl suspend" "" &
