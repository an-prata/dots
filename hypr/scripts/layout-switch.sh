#!/usr/bin/bash

LAYOUT=$(hyprctl -j getoption general:layout | jq '.str' | sed 's/"//g')

case $LAYOUT in
"master")
  if [ "$1" == "get" ]; then
    echo "Master"
  else
    hyprctl keyword general:layout dwindle
  fi

  # notify-send -a Hyprland -i "$HOME/.config/hypr/assets/hyprland.png" "Layout" "Dwindle"
  ;;
"dwindle")
  if [ "$1" == "get" ]; then
    echo "Dwindle"
  else
    hyprctl keyword general:layout master
  fi

  # notify-send -a Hyprland -i "$HOME/.config/hypr/assets/hyprland.png" "Layout" "Master"
  ;;
*) ;;
esac

pkill -RTMIN+2 waybar
