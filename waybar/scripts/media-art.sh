#!/usr/bin/env bash

PLAYER_SAVE="/tmp/waybar-media-player"
IMAGE_PATH="/tmp/waybar-media-art.png"
MAGICK_OPTIONS="-gravity center -crop 4:1 -resize 128x32"

# uses the player of the "media.sh" script
player=$(cat $PLAYER_SAVE)

# produce a new mask is one is missing
if [ ! -f "$HOME/.config/waybar/mask.png" ]; then
  convert -size 128x32 xc:black -fill white -draw "roundRectangle 0,0,128,32 16,16" "$HOME/.config/waybar/mask.png"
fi

img=$(echo "$(playerctl $player metadata | grep artUrl | awk '{print $3}')" | cut -c 7-)
if [ "$img" == "" ]; then
  cp "$HOME/.config/waybar/default.png" $IMAGE_PATH
else
  magick $img $MAGICK_OPTIONS $IMAGE_PATH
fi

magick $IMAGE_PATH "$HOME/.config/waybar/mask.png" -alpha Off -compose CopyOpacity -composite $IMAGE_PATH
echo $IMAGE_PATH

artist=$(playerctl $player metadata --format '{{artist}}')
title=$(playerctl $player metadata --format '{{album}}')

if [ "$title" == "" ]; then
  title=$(playerctl $player metadata --format '{{title}}')
fi

if [ "$artist" == "" ] && [ "$title" != "" ]; then
  txt="$title"
elif [ "$artist" != "" ] && [ "$title" == "" ]; then
  txt="$artist"
elif [ "$artist" != "" ] && [ "$title" != "" ]; then
  txt="$artist | $title"
else
  txt=""
fi

echo $txt

