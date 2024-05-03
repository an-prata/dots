#!/usr/bin/env fish

playerctl $argv[1]

# fix for MPD pause on skip
switch "$argv[1]"
    case next previous
        playerctl play-pause
        playerctl play-pause
end

pkill -RTMIN+1 waybar
