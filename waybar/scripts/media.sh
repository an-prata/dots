#!/usr/bin/env bash

playerStatus=$(playerctl -l --no-messages)

txt=" $(playerctl status --no-messages) 󰎉 $(playerctl metadata --format '{{artist}}') - $(playerctl metadata --format '{{title}}') "

txt="${txt/&/&amp;}"

echo "$txt"

