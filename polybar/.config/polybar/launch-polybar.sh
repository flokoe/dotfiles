#!/bin/bash

# terminate already running polybar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar > /dev/null; do sleep 1; done

# Launch flokoeBar
polybar flokoeBar &
