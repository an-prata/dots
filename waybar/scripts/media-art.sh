#!/usr/bin/env bash

playerStatus=$(playerctl -l --no-messages)

if [ "$playerStatus" == "mpd" ]; then
  img=$(echo "$(playerctl metadata | grep artUrl | awk '{print $3}')" | cut -c 7-)
  if [ "$img" == "" ]; then
    cp "$HOME/.config/waybar/default.png" "$HOME/.config/waybar/current.png"
  else
    magick $img -gravity center -crop 4:1 "$HOME/.config/waybar/current.png"
  fi
elif [ "${playerStatus:0:7}" == "firefox" ]; then
  path="$HOME/.mozilla/firefox/firefox-mpris/"
  image="$(ls $path)"
  magick "$path$image" -gravity center -crop 4:1 "$HOME/.config/waybar/current.png"
else
  magick "$HOME/.config/waybar/default.png" -gravity center -crop 4:1 "$HOME/.config/waybar/current.png"
fi

if [ ! -f "$HOME/.config/waybar/mask.png" ]; then
  convert -size 128x32 xc:black -fill white -draw "roundRectangle 0,0,128,32 14,14" "$HOME/.config/waybar/mask.png"
fi

magick "$HOME/.config/waybar/current.png" -resize 128x32 "$HOME/.config/waybar/current.png"
convert "$HOME/.config/waybar/current.png" "$HOME/.config/waybar/mask.png" -alpha Off -compose CopyOpacity -composite "$HOME/.config/waybar/current.png"
echo "$HOME/.config/waybar/current.png"
echo "$(playerctl metadata --format '{{artist}}') - $(playerctl metadata --format '{{album}}')"

