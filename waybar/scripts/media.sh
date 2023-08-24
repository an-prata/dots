#!/usr/bin/env bash

PLAYER_SAVE="/tmp/waybar-media-player"
PLAYER_MPD="--player=mpd"
PLAYER_FIREFOX=""

if [ ! -f $PLAYER_SAVE ]; then
  touch $PLAYER_SAVE
fi

player=$(cat $PLAYER_SAVE)
status=$(playerctl $player status)

if [ "$status" != "Playing" ]; then
  if [ "$player" == "$PLAYER_MPD" ]; then
    if [ "$(playerctl $PLAYER_FIREFOX status)" == "Playing" ]; then
      player=$PLAYER_FIREFOX
    fi
  elif [ "$player" == "$PLAYER_FIREFOX" ]; then
    if [ "$(playerctl $PLAYER_MPD status)" == "Playing" ]; then
      player=$PLAYER_MPD
    fi
  fi
fi

echo $player > $PLAYER_SAVE

txt="$(playerctl $player status --no-messages) 󰎉 $(playerctl $player metadata --format '{{artist}}') - $(playerctl $player metadata --format '{{title}}')"
tt=$txt

# cut off strings longer than 64 chars
if (( ${#txt} > 64 )); then
  txt="$(echo $txt | cut -c -61)..."
fi

# escape ampersands
txt="${txt/&/&amp;}"
tt="${tt/&/&amp;}"

echo "$txt"
echo "$tt"
echo ""

