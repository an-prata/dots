#!/usr/bin/env bash

playerStatus=$(playerctl -l --no-messages)

txt="$(playerctl status --no-messages) 󰎉 $(playerctl metadata --format '{{artist}}') - $(playerctl metadata --format '{{title}}')"
tt=$txt

# cut off strings longer than 64 chars
if [ ${#txt} > 64 ]; then
  txt="$(echo $txt | cut -c -61)..."
fi

# escape ampersands
txt="${txt/&/&amp;}"
tt="${tt/&/&amp;}"

echo "$txt"
echo "$tt"
echo ""

