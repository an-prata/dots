#!/usr/bin/env fish

# Takes a screenshot and saves it to save_dir with the name file_name

set save_dir "$HOME/Pictures/Temporary Screenshots"
set file_name "Screenshot on $(date +"%A %B %d, %Y - %-I:%M:%S %p").png"

set region $(slurp -d -w 0 -b '#ffffff40' -c '#17171Cff' -s '#ffffff00' -F 'JetBrainsMono')

# sleep so slurp's selection visuals dont appear in the screenshot
grim -g "$region" "$save_dir/$file_name"

if test "$status" = 0
    wl-copy <"$save_dir/$file_name"

    set open $(notify-send "Took a screenshot" "$save_dir/$file_name" --action 'default=default' -i "$save_dir/$file_name")

    if test "$open" = default
        swappy -f "$save_dir/$file_name"
    end
end
