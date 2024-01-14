#!/usr/bin/bash

# Takes a screenshot and saves it to SAVE_DIR with the name FILE_NAME

SAVE_DIR="$HOME/Pictures/Temporary Screenshots"
FILE_NAME="Screenshot on $(date +"%A %B %d, %Y - %-I:%M:%S %p").png"

grim -g "$(slurp)" "$SAVE_DIR/$FILE_NAME"

if [[ $? == "0" ]]; then
  OPEN=$(notify-send "Took a screenshot" "$SAVE_DIR/$FILE_NAME" --action=OPEN=open -i "$SAVE_DIR/$FILE_NAME")

  if [[ "$OPEN" == "OPEN" ]]; then 
    viewnior "$SAVE_DIR/$FILE_NAME"
  fi
fi
