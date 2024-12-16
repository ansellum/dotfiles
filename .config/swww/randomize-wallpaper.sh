#!/bin/bash

# Set the path to the wallpapers directory
wallpapersDir="$HOME/Pictures/Wallpapers/rotation"

# Set swwww config
FPS=144
TYPE="grow"
DURATION=1
BEZIER=".43,1.19,1,.4"
POS="top-right"
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION --transition-bezier $BEZIER --transition-pos $POS"

# Get a list of all image files in the wallpapers directory
readarray -t wallpapers <./unused-papers.txt

echo "length: ${#wallpapers[@]}"

# Check if the wallpapers array is empty
if [ ${#wallpapers[@]} -le 1 ]; then
  # If the array is empty, refill it with the image files
  wallpapers=("$wallpapersDir"/*)
fi

# Select a random wallpaper from the array
wallpaperIndex=$((RANDOM % ${#wallpapers[@]}))
selected="${wallpapers[$wallpaperIndex]}"

# Update the wallpaper using the swww img command
swww img "$selected" $SWWW_PARAMS

# Remove the selected wallpaper from the array
for i in "${!wallpapers[@]}"; do
  if [[ ${wallpapers[i]} = $selected ]]; then
    unset 'wallpapers[i]'
  fi
done

# Write back to file
printf "%s\n" "${wallpapers[@]}" >./unused-papers.txt
