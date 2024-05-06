#!/usr/bin/env fish

switch $argv[1]
    case get
        switch $WINDOW_START
            case tiling
                echo Tiling
                exit
            case floating
                echo Floating
                exit
            case '*'
                echo Unknown
                exit
        end

    case toggle
        switch $WINDOW_START
            case tiling
                hyprctl keyword windowrule 'float,title:.*'
                set -U WINDOW_START floating
                echo set floating
            case floating
                hyprctl keyword windowrule 'tile,title:.*'
                set -U WINDOW_START tiling
                echo set tiling

        end

    case start
        switch $WINDOW_START
            case tiling
                hyprctl keyword windowrule 'tile,title:.*'
                set -U WINDOW_START tiling
                echo set tiling
            case floating
                hyprctl keyword windowrule 'float,title:.*'
                set -U WINDOW_START floating
                echo set floating
        end
end

pkill -RTMIN+3 waybar
