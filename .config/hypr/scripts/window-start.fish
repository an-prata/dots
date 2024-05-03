#!/usr/bin/env fish

if test "$WINDOW_START" = tiling
    if test "$argv[1]" = get
        echo Tiling
        exit
    end

    hyprctl keyword windowrule 'float,title:.*'
    set -U WINDOW_START floating
    echo set floating
else
    if test "$argv[1]" = get
        echo Floating
        exit
    end

    hyprctl keyword windowrule 'tile,title:.*'
    set -U WINDOW_START tiling
    echo set tiling
end

pkill -RTMIN+3 waybar
