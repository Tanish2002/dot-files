#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

int=$(iwgetid | getn 1)
sed -i "s/interface = .*/interface = \"$int\"/g" ~/polybar/config
# Launch bar1 and bar2
polybar white &
#polybar bar2 &

echo "Bars launched..."
