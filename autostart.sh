#!/bin/bash

function start {
  cmd_name=$(basename "$1")
  grep -q "$cmd_name" <<< "$running" || "$@" &
}

running="$(ps aux)"

start nitrogen --restore
start dwmblocks
start ~/dwm/low-battery-warning.sh 10 300
start ~/dwm/full-battery-notification.sh 90 600
start picom -b
start dunst
start redshift-gtk -l 51:0 -t 6500:3000
start nm-applet
start earlyoom -r 3600 -n --avoid '(^|/)(init|systemd.*|Xorg|sshd)$'
start systembus-notify
start unclutter
start xset dpms 0 0 300
start xidlehook --not-when-audio --timer 600 "xset dpms force standby" "" --timer 10 "systemctl suspend" ""
start ~/dwm/keyd-indicator
