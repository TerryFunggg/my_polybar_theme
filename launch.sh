#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#polybar -r bar &

external_monitor=$(xrandr --query | grep 'HDMI1')
if [ $external_monitor = *connected* ]; then
	polybar -r top &
	polybar -r top_external &
else
	polybar -r bar &
fi


echo "Polybar launched..."
