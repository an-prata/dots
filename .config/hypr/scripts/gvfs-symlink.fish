#!/usr/bin/env fish

set VOLUMES_DIR "$HOME/Volumes/"
set GVFS_DIR "$XDG_RUNTIME_DIR/gvfs/"

for volume in $(ls $GVFS_DIR)
    set link_name $volume

    switch $volume
        case 'smb-share:*'
            set opts $(string split ',' $volume)

            for opt in $opts
                switch $opt
                    case 'share=*'
                        set link_name $(string sub -s 7 $opt)
                        set link_name $(string unescape --style=url $link_name)
                end
            end
    end

    mkdir -p "$VOLUMES_DIR"

    if not test -e "$VOLUMES_DIR/$link_name"
        ln -s "$GVFS_DIR/$volume" "$VOLUMES_DIR/$link_name"
    end
end
