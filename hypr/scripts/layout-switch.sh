#!/usr/bin/bash

LAYOUT=$(hyprctl -j getoption general:layout | jq '.str' | sed 's/"//g')

DWINDLE_ICON="󰝘"
DWINDLE_TT="Dwindle Layout"
MASTER_ICON=""
MASTER_TT="Master Layout"
ACTIVE="active"
INACTIVE="inactive"

case $LAYOUT in
"master")
  if [ "$1" == "master" ]; then
    echo "$MASTER_ICON"
    echo "$MASTER_TT"
    echo "$ACTIVE"
  elif [ "$1" == "dwindle" ]; then
    echo "$DWINDLE_ICON"
    echo "$DWINDLE_TT"
    echo "$INACTIVE"
  else
    hyprctl keyword general:layout dwindle
    pkill -RTMIN+2 waybar
    pkill -RTMIN+1 waybar
  fi

  # notify-send -a Hyprland -i "$HOME/.config/hypr/assets/hyprland.png" "Layout" "Dwindle"
  ;;
"dwindle")
  if [ "$1" == "master" ]; then
    echo "$MASTER_ICON"
    echo "$MASTER_TT"
    echo "$INACTIVE"
  elif [ "$1" == "dwindle" ]; then
    echo "$DWINDLE_ICON"
    echo "$DWINDLE_TT"
    echo "$ACTIVE"
  else
    hyprctl keyword general:layout master
    pkill -RTMIN+2 waybar
    pkill -RTMIN+1 waybar
  fi
  # notify-send -a Hyprland -i "$HOME/.config/hypr/assets/hyprland.png" "Layout" "Master"
  ;;
*) ;;
esac

