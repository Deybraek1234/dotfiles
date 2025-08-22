#!/bin/bash

# Check if a file was passed
if [ -z "$1" ]; then
  echo "No wallpaper file provided."
  exit 1
fi

WALLPAPER_FILE="$1"

cp "$WALLPAPER_FILE" /tmp/picture.jgp &

wal -i "$WALLPAPER_FILE" -n -q
wal -i "$WALLPAPER_FILE" --s ~/.config/wal/templates/starship.toml.template -o ~/.config/starship.toml &
swww img "$WALLPAPER_FILE" --transition-type wave --transition-fps 60 --transition-duration 1 &
pkill -SIGUSR2 waybar
~/scripts/mako.sh "$WALLPAPER_FILE"
~/scripts/starship.sh
