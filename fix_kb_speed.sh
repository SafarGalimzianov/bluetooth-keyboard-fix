#!/bin/bash

# My keyboard that needs to match system speed
# Device D1:03:D1:96:97:94 FEKER Alice-1

DEVICE="D1:03:D1:96:97:94"
DEFAULT_SPEED=25


while true; do
    gsettings set org.cinnamon.desktop.peripherals.keyboard repeat-interval 30
    if bluetoothctl info "$DEVICE" | grep -q "Connected: yes"; then
        # Wait for session to load Cinnamon settings
        sleep 5
        # Set my settings
	gsettings set org.cinnamon.desktop.peripherals.keyboard repeat-interval 30

        break
    fi
    sleep 5
done
