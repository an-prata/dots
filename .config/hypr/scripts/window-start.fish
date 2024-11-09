#!/usr/bin/env fish

# Set the start state for windows to tiling
function tile_windows
    hyprctl keyword windowrule 'tile,title:.*'
    hyprctl keyword dwindle:pseudotile false
    set -U WINDOW_START tiling
    echo set tiling
end

# Set the start state for windows to pseudo-tiling
function pseudo_tile_windows
    hyprctl keyword windowrule 'tile,title:.*'
    # hyprctl keyword dwindle:pseudotile true
    # hyprctl keyword windowrule 'pseudo,title:.*'
    set -U WINDOW_START pseudo_tiling
    echo set pseudo_tiling
end

# Set the start state for windows to floating
function float_windows
    hyprctl keyword windowrule 'float,title:.*'
    set -U WINDOW_START floating
    echo set floating
end

switch $argv[1]
    case get
        switch $WINDOW_START
            case tiling
                echo "/usr/share/icons/Colloid-Grey-Dark/actions/16/horizontal.svg"
                echo Tiling
                exit
                # case pseudo_tiling
                #     echo "/usr/share/icons/Colloid-Grey-Dark/actions/16/gtk-fullscreen.svg"
                #     echo Pseudo-Tiling
                #     exit
            case floating
                echo "/usr/share/icons/Colloid-Grey-Dark/actions/16/spray-mode-copy.svg"
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
                #     pseudo_tile_windows
                # case pseudo_tiling
                float_windows
            case '*'
                tile_windows
        end

    case start
        switch $WINDOW_START
            case floating
                float_windows
                # case pseudo_tiling
                #     pseudo_tile_windows
            case '*'
                tile_windows
        end
end

pkill -RTMIN+3 waybar
