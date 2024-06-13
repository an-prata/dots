#!/usr/bin/env fish

# close if open, then exit
if test $(pidof bemenu)
    killall bemenu
    exit
end

set normal_background '#262626a0'

set bemenu_colors "--nb '#00000000' --ab '#00000000' --hb '#00000000' --fb '$normal_background' --tb '$normal_background' --fbb '#00000000' --scb '#00000000' --cb '#00000000' --nf '#f2f2e9' --af '#f2f2e9' --hf '#f2f2e9' --ff '#f2f2e9' --tf '#f2f2e9'"

set bemenu_options "--bottom --fixed-height --fn 'JetBrainsMono 11' --wrap --prompt '->' --ignorecase --cw 1 --ch 16 --line-height 28 --hp 12 --border 1 --bdr '#323232'"

j4-dmenu-desktop --no-generic --term='kitty' --dmenu="bemenu $bemenu_colors $bemenu_options"
