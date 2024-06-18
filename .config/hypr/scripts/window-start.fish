#!/usr/bin/env fish

switch $argv[1]
    case get
        switch $WINDOW_START
            case tiling
                echo "/usr/share/icons/Colloid-dark/actions/16/window.svg"
                echo Tiling
                exit
            case floating
                echo "/usr/share/icons/Colloid-dark/actions/16/window-duplicate.svg"
                echo Floating
                exit
            case '*'
                echo ""
                echo Unknown
                exit
        end

    case toggle
        switch $WINDOW_START
            case tiling
                hyprctl keyword windowrule 'float,title:.*'
                set -U WINDOW_START floating
                echo set floating
            case '*'
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
            case '*'
                hyprctl keyword windowrule 'float,title:.*'
                set -U WINDOW_START floating
                echo set floating
        end
end

pkill -RTMIN+3 waybar
