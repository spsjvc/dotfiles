#!/bin/bash

current=$(brightnessctl g)
max=$(brightnessctl m)
percentage=$((current * 100 / max))

notify-send -t 1000 -r 9994 "Brightness: ${percentage}%"
