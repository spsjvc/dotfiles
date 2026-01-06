#!/bin/bash

is_muted=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -Po 'yes|no')

if [ "$is_muted" = "yes" ]; then
    notify-send -t 1000 -r 9993 "Volume: Muted"
else
    percentage=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -1)
    notify-send -t 1000 -r 9993 "Volume: ${percentage}%"
fi
