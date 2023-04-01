#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Low battery threshold and time interval not provided"
	exit 1
fi

while true; do
  battery_info=$(acpi)
  percentage=$(echo $battery_info | awk -F', ' '{sub("%", ""); print $2}')
  if [ $percentage -le $1 ] && $(echo $battery_info | grep -q Discharging); then
    notify-send -u critical "Warning: Battery is low"
  fi
  sleep $2
done
