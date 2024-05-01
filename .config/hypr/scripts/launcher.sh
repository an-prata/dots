#!/usr/bin/bash

# close if open, then exit
if [[ $(pidof bemenu) != '' ]]; then
  killall bemenu
  exit
fi

normal_background='#26262D' #'#17171C50'

bemenu_colors="--nb '$normal_background' --ab '$normal_background' --hb '$normal_background' --fb '$normal_background' --tb '$normal_background' --nf '#f2f2e9' --af '#f2f2e9' --hf '#f2f2e9' --ff '#f2f2e9' --tf '#f2f2e9'"

bemenu_options="--center --list 6 --margin 680 --fixed-height --fn 'JetBrainsMono 11' --wrap --prompt '' --ignorecase --prefix '->' --cw 1 --ch 16 --line-height 24"

j4-dmenu-desktop --no-generic --term='kitty' --dmenu="bemenu $bemenu_colors $bemenu_options"

