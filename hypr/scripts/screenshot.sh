#!/usr/bin/bash

# Takes a screenshot and saves it to SAVE_DIR with the name FILE_NAME

SAVE_DIR="$HOME/Pictures/Temporary Screenshots"
FILE_NAME="Screenshot on $(date +"%A %B %d, %Y - %-I:%M:%S %p").png"

grim -g "$(slurp)" "$SAVE_DIR/$FILE_NAME"

if [[ $? == "0" ]]; then
  notify-send "Took a screenshot" "$SAVE_DIR/$FILE_NAME" -a "grim" -i "$SAVE_DIR/$FILE_NAME"
fi
