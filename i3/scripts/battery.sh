#!/bin/bash

battery=$(cat /sys/class/power_supply/BAT1/capacity)
status=$(cat /sys/class/power_supply/BAT1/status)

# removed the infinite loop and set up a cron job to run this script every minute
if [ "$status" == "Discharging" ] && [ "$battery" -lt 20 ]; then
        XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send "Battery Low" "Please plug in your charger."
elif [ "$status" == "Charging" ] && [ "$battery" -gt 95 ]; then
        XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send "Battery Full" "Please unplug your charger." -i "  "
fi

