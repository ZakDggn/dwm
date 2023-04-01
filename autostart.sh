dwmblocks &
dunst &
redshift-gtk -l 51:0 &
picom -b &
nm-applet &
setxkbmap -option caps:ctrl_modifier; xcape -e '#66=Escape'
# nitrogen --restore &
~/dwm/low-battery-warning.sh 10 120 &
earlyoom -r 3600 -n --avoid '(^|/)(init|systemd.*|Xorg|sshd)$' &
systembus-notify &
unclutter &
