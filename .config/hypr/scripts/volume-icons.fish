#!/usr/bin/env fish

switch $argv[1]
    case update
        pkill -RTMIN+6 waybar
        exit
    case '*'
        set volume_string $(wpctl get-volume @DEFAULT_AUDIO_SINK@)
        set volume $(string sub --start=9 $volume_string)

        switch $volume_string
            case '*MUTED*'
                echo "/usr/share/icons/Colloid-dark/status/16/audio-volume-muted-blocking-panel.svg"
                echo Muted
            case '*'
                if test $volume -gt 0.5
                    set icon "/usr/share/icons/Colloid-dark/status/16/audio-volume-high-panel.svg"
                    set notif_value $(math $volume x 100)

                    if test "$VOLUME_N_ID" = ""
                        set -U VOLUME_N_ID $(notify-send "$notif_value" -i $icon -h int:value:$notif_value -h string:synchronous:volume -p)
                    else
                        set -U VOLUME_N_ID $(notify-send "$notif_value" -r $VOLUME_N_ID -i $icon -h int:value:$notif_value -h string:synchronous:volume -p)
                    end

                    echo $icon
                else if test $volume -gt 0.25
                    set icon "/usr/share/icons/Colloid-dark/status/16/audio-volume-medium-panel.svg"
                    set notif_value $(math $volume x 100)

                    if test "$VOLUME_N_ID" = ""
                        set -U VOLUME_N_ID $(notify-send "$notif_value" -i $icon -h int:value:$notif_value -h string:synchronous:volume -p)
                    else
                        set -U VOLUME_N_ID $(notify-send "$notif_value" -r $VOLUME_N_ID -i $icon -h int:value:$notif_value -h string:synchronous:volume -p)
                    end

                    echo $icon
                else
                    set icon "/usr/share/icons/Colloid-dark/status/16/audio-volume-low-panel.svg"
                    set notif_value $(math $volume x 100)

                    if test "$VOLUME_N_ID" = ""
                        set -U VOLUME_N_ID $(notify-send "$notif_value" -i $icon -h int:value:$notif_value -h string:synchronous:volume -p)
                    else
                        set -U VOLUME_N_ID $(notify-send "$notif_value" -r $VOLUME_N_ID -i $icon -h int:value:$notif_value -h string:synchronous:volume -p)
                    end

                    echo $icon
                end

                echo $volume
        end
end
