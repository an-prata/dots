#!/usr/bin/bash

function toggle() {
    dunstctl set-paused toggle
    pkill -RTMIN+4 waybar
}

function get() {
    paused="$(dunstctl is-paused)"

    if [ $paused == "true" ]; then
        echo "Silenced"
    else
        echo "Notifying"
    fi
}

case $1 in
    "toggle")
        toggle
        exit
    ;;
    "get")
        get
        exit
    ;;
    *)
    ;;
esac
