dwmblocks &
dunst &
redshift-gtk -l 51:0 &
picom -b &
nm-applet &
setxkbmap -option caps:escape &
# nitrogen --restore &
~/setup-scripts/low-battery-warning 10 120 &
earlyoom -r 3600 -n --avoid '(^|/)(init|systemd.*|Xorg|sshd)$' &
systembus-notify &
