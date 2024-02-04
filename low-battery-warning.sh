#!/bin/bash

if ! command -v acpi &> /dev/null; then
  exit
fi

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Low battery threshold and time interval not provided"
  exit 1
fi

while true; do
  battery_info=$(acpi)
  percentage=$(echo "$battery_info" | awk -F', ' '{sub("%", ""); print $2}')
  if [ "$percentage" -le "$1" ] && grep -q Discharging <<< "$battery_info"; then
    notify-send -u critical "Warning: Battery low"
  fi
  sleep "$2"
done
