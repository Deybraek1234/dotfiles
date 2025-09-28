#!/bin/bash

# Define the directory where screenshots will be saved.
# Using $HOME is the most reliable way to reference your home directory.
SCREENSHOTS_DIR="$HOME/Pictures/Screenshots"

# Create the directory if it doesn't already exist.
# The -p flag prevents an error if the directory already exists.
mkdir -p "$SCREENSHOTS_DIR"

# Define the filename based on the current date and time.
FILENAME=$(date '+%Y%m%d-%H%M%S').png

# Combine the directory and filename to create the full path.
FULL_PATH="$SCREENSHOTS_DIR/$FILENAME"

# 1. Take a screenshot of a selected area and save it as a PNG.
# The `grim` command captures the area selected by `slurp`.
grim -g "$(slurp)" "$FULL_PATH"

# 2. Check if the screenshot was successfully saved.
# If the file exists, proceed with the next steps.
if [ -f "$FULL_PATH" ]; then
    # 3. Copy the saved image to the clipboard.
    # We use wl-copy to put the file on the clipboard.
    wl-copy < "$FULL_PATH"

    # 4. Send a notification to confirm the action.
    notify-send "Screenshot Saved & Copied" "Path: $FULL_PATH"
else
    # 5. Send an error notification if the screenshot failed to save.
    notify-send "Screenshot Failed" "Could not save the screenshot."
fi

