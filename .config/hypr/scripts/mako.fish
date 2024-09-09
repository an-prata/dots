#!/usr/bin/env fish

function toggle
    set paused $(makoctl mode)

    switch "$paused"
        case "*dnd"
            makoctl mode -r dnd
        case '*'
            makoctl mode -a dnd
    end

    pkill -RTMIN+4 waybar
end

function get
    set paused $(makoctl mode)

    switch "$paused"
        case "*dnd"
            echo "/usr/share/icons/Colloid-dark/status/16/weather-clear-night.svg"
            echo Silenced
        case '*'
            echo "/usr/share/icons/Colloid-dark/status/16/indicator-messages.svg"
            echo Notifying
    end
end

switch $argv[1]
    case toggle
        toggle
    case get
        get
    case start
        toggle
        toggle
end
