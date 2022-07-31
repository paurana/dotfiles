#!/bin/bash

# TODO: use cron instead of while loop
while true; do
        battery=$(cat /sys/class/power_supply/BAT1/capacity)
        status=$(cat /sys/class/power_supply/BAT1/status)

        if [ "$status" == "Discharging" ] && [ "$battery" -lt 20 ]; then
                notify-send "Battery Low. Please plug in your charger."
        elif [ "$status" == "Charging" ] && [ "$battery" -gt 95 ]; then
                notify-send "Battery Full. Please unplug your charger."
        fi
        sleep 30
done

