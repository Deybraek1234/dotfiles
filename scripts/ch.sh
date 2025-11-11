#!/bin/bash

dir="${HOME}/Pictures/wallpapers"
l="$(find "$dir" -name '*.jpg' -o -name '*.png' | shuf -n1)"

if [ -z "$l" ]; then
	exit1
fi
cp "$l" /tmp/picture.jgp &
wal -i "$l" -n -q
wal -i "$l" -n -t ~/.config/wal/templates/starship.toml.template -o ~/.config/starship.toml &
swww img "$l" --transition-type "wave" --transition-fps 60 --transition-duration 1
pywal-spicetify text
~/scripts/mako.sh "$l"
~/scripts/starship.sh
