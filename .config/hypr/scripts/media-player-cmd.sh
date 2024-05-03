#!/usr/bin/env bash

playerctl $1
pkill -RTMIN+1 waybar

