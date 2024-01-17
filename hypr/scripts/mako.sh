#!/usr/bin/bash

function toggle() {
    if [ $(get) == "Silenced" ]; then
        makoctl mode -r dnd
    else
        makoctl mode -a dnd
    fi 

    pkill -RTMIN+4 waybar
}

function get() {
    paused="$(makoctl mode)"

    case $paused in
        *"dnd"*)
            echo "Silenced"
        ;;
        *)
            echo "Notifying"
        ;;
    esac
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
