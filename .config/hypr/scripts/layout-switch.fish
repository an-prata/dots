#!/usr/bin/env fish

set layout $(hyprctl -j getoption general:layout | jq '.str' | sed 's/"//g')

switch $layout
    case master
        if test "$argv[1]" = get
            echo "/usr/share/icons/Colloid-Grey-Dark/actions/16/align-horizontal-left-to-anchor.svg"
            echo Master
            exit
        else
            hyprctl keyword general:layout dwindle
            pkill -RTMIN+2 waybar
        end

    case dwindle
        if test "$argv[1]" = get
            echo "/usr/share/icons/Colloid-Grey-Dark/actions/16/align-vertical-bottom.svg"
            echo Dwindle
            exit
        else
            hyprctl keyword general:layout master
            pkill -RTMIN+2 waybar
        end

end
