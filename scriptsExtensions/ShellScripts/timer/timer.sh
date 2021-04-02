#!/bin/bash

echo "Enter minutes"
read minutes

# sleep 2 && xset dpms force off

sleep "$((minutes * 60))"

# amixer -c 0 set Master playback 0% mute
# pm-hibernate
# pm-suspend

shutdown -h now
