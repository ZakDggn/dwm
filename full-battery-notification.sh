#!/bin/bash

if ! command -v acpi &> /dev/null; then
  exit
fi

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Full battery threshold and time interval not provided"
  exit 1
fi

while true; do
  battery_info=$(acpi)
  percentage=$(echo "$battery_info" | awk -F', ' '{sub("%", ""); print $2}')
  if [ "$percentage" -ge $1 ] && grep -q 'Charging\|Full' <<< "$battery_info"; then
    notify-send "Battery charged"
  fi
  sleep "$2"
done
