#!/bin/bash

# Custom Bluetooth status script for Polybar with Catppuccin Mocha theming
# This script provides a simple bluetooth status without the bc dependency issues

# Check if bluetooth is powered on
if ! bluetoothctl show | grep -q "Powered: yes"; then
    echo "%{F#6c7086}󰂲%{F-}"  # Bluetooth off icon (overlay0 color)
    exit 0
fi

# Get connected devices
connected_devices=$(bluetoothctl devices Connected 2>/dev/null | wc -l)

if [ "$connected_devices" -gt 0 ]; then
    # Get the first connected device name
    device_info=$(bluetoothctl devices Connected 2>/dev/null | head -1)
    if [ -n "$device_info" ]; then
        device_mac=$(echo "$device_info" | awk '{print $2}')
        device_name=$(bluetoothctl info "$device_mac" 2>/dev/null | grep "Alias" | cut -d ' ' -f 2- | head -1)
        if [ -n "$device_name" ]; then
            echo "%{F#74c7ec}󰂱%{F-} $device_name"  # Bluetooth connected icon (sapphire) with device name
        else
            echo "%{F#74c7ec}󰂱%{F-}"  # Just bluetooth connected icon (sapphire)
        fi
    else
        echo "%{F#74c7ec}󰂱%{F-}"  # Just bluetooth connected icon (sapphire)
    fi
else
    echo "%{F#89dceb}󰂯%{F-}"  # Bluetooth on but not connected icon (sky color)
fi