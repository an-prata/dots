#!/usr/bin/env fish

# close if open, then exit
if test -n "$(pidof bemenu)"
    killall bemenu
    exit
end

set normal_background '#26262D'

cliphist list | bemenu --nb $normal_background --ab $normal_background --hb $normal_background --fb $normal_background --tb $normal_background --nf '#f2f2e9' --af '#f2f2e9' --hf '#f2f2e9' --ff '#f2f2e9' --tf '#f2f2e9' --bottom --fixed-height --fn 'JetBrainsMono 11' --wrap --prompt '' --ignorecase --prefix '->' --cw 1 --ch 16 --line-height 24 | cliphist decode | wl-copy
