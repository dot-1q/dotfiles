#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload monitor &
done
else
  polybar --reload example &
fi

echo "Bars launched..."
