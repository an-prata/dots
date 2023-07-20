#!/usr/bin/bash

LAYOUT=$(hyprctl -j getoption general:layout | jq '.str' | sed 's/"//g')

case $LAYOUT in
"master")
  hyprctl keyword general:layout dwindle
  notify-send -a Hyprland -i "$HOME/.config/hypr/assets/hyprland.png" "Layout" "Dwindle"
  ;;
"dwindle")
  hyprctl keyword general:layout master
  notify-send -a Hyprland -i "$HOME/.config/hypr/assets/hyprland.png" "Layout" "Master"
  ;;
*) ;;
esac
