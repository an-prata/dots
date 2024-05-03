#!/usr/bin/env fish

function toggle
    if test "$(get)" = Silenced
        makoctl mode -r dnd
    else
        makoctl mode -a dnd
    end

    pkill -RTMIN+4 waybar
end

function get
    set paused $(makoctl mode)

    switch "$paused"
        case "*dnd"
            echo Silenced
        case '*'
            echo Notifying
    end
end

switch $argv[1]
    case toggle
        toggle
    case get
        get
end
