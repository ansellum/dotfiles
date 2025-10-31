#!/bin/bash

# Set the path to the wallpapers directory
wallDIR="$HOME/Pictures/Wallpapers/rotation"

# Set monitor
focused_monitor=$(hyprctl monitors | awk '/^Monitor/{name=$2} /focused: yes/{print name}')

# Set swwww config
FPS=144
TYPE="grow"
DURATION=1
BEZIER=".43,1.19,1,.4"
POS="top-right"
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION --transition-bezier $BEZIER --transition-pos $POS"

# Find random picture amongst rotation
PICS=($(find ${wallDIR} -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \)))
RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

# Update the wallpaper on selected monitor
swww img -o $focused_monitor "${RANDOMPICS}" $SWWW_PARAMS
