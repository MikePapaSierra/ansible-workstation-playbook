#!/usr/bin/env bash

# Kill all running instances of polybar
killall -q polybar

# Launch polybar using default configuration
polybar 2>&1 | tee -a /tmp/polybar.log & disown
echo "Polybar launched..."
