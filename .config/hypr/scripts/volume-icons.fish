#!/usr/bin/env fish

# Simply sends a signal to waybar to update the module.
if test "$argv[1]" = update
    pkill -RTMIN+6 waybar
    exit
end

set volume_string $(wpctl get-volume @DEFAULT_AUDIO_SINK@)
set volume $(string sub --start=9 $volume_string)

set name_entry $(wpctl inspect @DEFAULT_AUDIO_SINK@ | grep 'alsa.card_name')
set name $(string split '"' $name_entry)[2]

if test "$name" != "$CURRENT_AUDIO_SINK_NAME"
    notify-send "New Default Audio Sink:" "$name" -i "/usr/share/icons/Colloid-Grey/devices/scalable/audio-speakers.svg"
end

set -U CURRENT_AUDIO_SINK_NAME "$name"

switch $volume_string
    case '*MUTED*'
        echo "/usr/share/icons/Colloid-Grey/status/16/audio-volume-muted-blocking-panel.svg"
        echo Muted
    case '*'
        # Set icon based on volume ranges
        if test $volume -gt 0.5
            set icon "/usr/share/icons/Colloid-Grey/status/16/audio-volume-high-panel.svg"
        else if test $volume -gt 0.25
            set icon "/usr/share/icons/Colloid-Grey/status/16/audio-volume-medium-panel.svg"
        else
            set icon "/usr/share/icons/Colloid-Grey/status/16/audio-volume-low-panel.svg"
        end

        # Give output for waybar module
        echo $icon
        echo $volume
end
