#!/bin/bash

# terminate already running greenclip daemons
killall -q greenclip

# Wait until the processes have been shut down
while pgrep -x greenclip > /dev/null; do sleep 1; done

# Launch greenclip daemon
greenclipBin=$HOME/bin/greenclip
$greenclipBin daemon &
