#!/usr/bin/env bash

PLAYER_FIREFOX=""

status=$(playerctl status)
artist=$(playerctl metadata --format '{{artist}}')
title=$(playerctl metadata --format '{{title}}')

if [ "$artist" == "" ] && [ "$title" != "" ]; then
  txt="$(playerctl status --no-messages) 󰎉 $title"
elif [ "$artist" != "" ] && [ "$title" == "" ]; then
  txt="$(playerctl status --no-messages) 󰎉 $artist"
elif [ "$artist" != "" ] && [ "$title" != "" ]; then
  txt="$(playerctl status --no-messages) 󰎉 $artist | $title"
else
  txt="$(playerctl status --no-messages) 󰎉"
fi

tt=$txt

# cut off strings longer than 64 chars
if (( ${#txt} > 64 )); then
  txt="$(echo $txt | cut -c -61)..."
elif [ "$txt" = " 󰎉" ]; then
  txt="No Media Playing 󰎉 :("
fi

# escape > and <
txt="${txt/</\<}"
tt="${tt/</\<}"

txt="${txt/>/\>}"
tt="${tt/>/\>}"

echo "$txt"
echo "$tt"
echo ""

