#!/bin/sh

# From: https://forums.linuxmint.com/viewtopic.php?f=90&t=217741
# Credits to user BlackVeils

# Steps:
# 1. Save this script to battery_notify.sh
# 2. Edit the 'alarm' variable to point to your sound file of choice
# 3. Give execution permission: chmod +x battery_notify.sh
# 4. Run the script to test it. If happy, add to your startup applications.

# Set the alert tone for battery, or leave it as empty quotes.
# .mp3 or .ogg audio file
alarm="~/bin/battery.ogg"

# Notify when below this percentage
warning_level=21

# How often to check battery status, in minutes
check_interval=2

while true; do
  battery_level=$(acpi -b \
    | cut -d, -f2 | cut --characters=2,3,4 \
    | sed 's/%//g')
  charging=$(acpi -b | grep -c "Charging")

  # When battery is low, and not already charging
  if [ $battery_level -lt 11 ] &&
     [ $charging -eq 0 ]
  then
    play -q -v 0.40 "$alarm" &
    notify-send " Low battery: ${battery_level}% " \
      " Plug into mains power " -t 8000
  fi
  
  sleep ${check_interval}m
done
