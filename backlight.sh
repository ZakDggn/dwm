#!/bin/bash

current=$(light -G)
if (( $(echo "$current < 1" | bc) )); then
  light -S 1
  current=1
fi

x=0.5
log=$(echo "l($current)" | bc -l)
change=$(echo "$x * $log * $log" | bc)

minChange=0.4
if (( $(echo "$change < $minChange" | bc) )); then
  change=$minChange
fi

if [ -z "$1" ]; then
  light -G
elif [ "$1" = '-A' ]; then
  light -A "$change"
elif [ "$1" = '-U' ]; then
  light -U "$change"
fi
