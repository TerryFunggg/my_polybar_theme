#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# some times I just want my big monitor whitout my laptop monitor
need_dual_monitor = 0

# xrandr can help you get the current active monitor info
external_monitor=$(xrandr --query | grep 'HDMI1')

if [[ $need_dual_monitor -eq 0 ]]; then
	polybar -r bar &
elif [[ $external_monitor = *connected* ]]; then
	polybar -r top &
	polybar -r top_external &
fi

echo "Polybar launched..."
