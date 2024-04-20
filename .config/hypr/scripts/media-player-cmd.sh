#!/usr/bin/env bash

PLAYER_SAVE="/tmp/waybar-media-player"

# uses the player of the "media.sh" script
player=$(cat $PLAYER_SAVE)

playerctl $player $1

# work around for weird issue where media stops on skip
playerctl $player play-pause
playerctl $player play-pause

pkill -RTMIN+1 waybar

