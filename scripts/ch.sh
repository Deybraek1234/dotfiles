#!/bin/bash

dir="${HOME}/Pictures/wallpapers"
l="$(find "$dir" -maxdepth 1 -type f | shuf -n 10 | shuf -n 1)"

if [ -z "$l" ]; then
	exit1
fi

cp "$l" /tmp/picture.jgp &
wal -i "$l" -n -q &
wal -i "$l" -n -t ~/.config/wal/templates/starship.toml.template -o ~/.config/starship.toml &
~/scripts/mako.sh "$l" &
~/scripts/starship.sh &
#~/scripts/spicetify.sh &
swww img "$l" --transition-type "wave" --transition-fps 60 --transition-duration 1
