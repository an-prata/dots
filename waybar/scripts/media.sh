#!/usr/bin/env bash

PLAYER_SAVE="/tmp/waybar-media-player"
PLAYER_MPD="--player=mpd"
PLAYER_MPV="--player=mpv"
PLAYER_FIREFOX=""

if [ ! -f $PLAYER_SAVE ]; then
  touch $PLAYER_SAVE
fi

player=$(cat $PLAYER_SAVE)
status=$(playerctl $player status)

if [ "$status" != "Playing" ]; then
  if [ "$(playerctl $PLAYER_FIREFOX status)" == "Playing" ]; then
    player=$PLAYER_FIREFOX
  elif [ "$(playerctl $PLAYER_MPD status)" == "Playing" ]; then
    player=$PLAYER_MPD
  elif [ "$(playerctl $PLAYER_MPV status)" == "Playing" ]; then
    player=$PLAYER_MPV
  fi
fi

if [ "$status" == "Stopped" ]; then
  if [ "$(playerctl $PLAYER_FIREFOX status)" != "Stopped" ]; then
    player=$PLAYER_FIREFOX
  elif [ "$(playerctl $PLAYER_MPD status)" != "Stopped" ]; then
    player=$PLAYER_MPD
  elif [ "$(playerctl $PLAYER_MPV status)" != "Stopped" ]; then
    player=$PLAYER_MPV
  fi
fi

echo $player > $PLAYER_SAVE

status=$(playerctl $player status)
artist=$(playerctl $player metadata --format '{{artist}}')
title=$(playerctl $player metadata --format '{{title}}')

if [ "$artist" == "" ] && [ "$title" != "" ]; then
  txt="$(playerctl $player status --no-messages) 󰎉 $title"
elif [ "$artist" != "" ] && [ "$title" == "" ]; then
  txt="$(playerctl $player status --no-messages) 󰎉 $artist"
elif [ "$artist" != "" ] && [ "$title" != "" ]; then
  txt="$(playerctl $player status --no-messages) 󰎉 $artist | $title"
else
  txt="$(playerctl $player status --no-messages) 󰎉"
fi

tt=$txt

# cut off strings longer than 64 chars
if (( ${#txt} > 64 )); then
  txt="$(echo $txt | cut -c -61)..."
elif [ "$txt" = " 󰎉" ]; then
  txt="No Media Playing 󰎉 :("
fi

# escape ampersands
txt="${txt/&/&amp;}"
tt="${tt/&/&amp;}"

echo "$txt"
echo "$tt"
echo ""

