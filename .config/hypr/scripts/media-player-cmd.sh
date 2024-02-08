#!/usr/bin/env bash

PLAYER_SAVE="/tmp/waybar-media-player"

# uses the player of the "media.sh" script
player=$(cat $PLAYER_SAVE)

playerctl $player $1
pkill -RTMIN+1 waybar

