if status is-interactive
    alias c="clear"
    alias cp="cp -rv"
    alias mv="mv -v"
    alias rm="rm -rfv"
    alias mkdir="mkdir -p"
    alias hx="helix"

    set -x XDG_CONFIG_HOME "$HOME/.config"
    set -x XDG_CACHE_HOME "$HOME/.cache"
    set -x XDG_DATA_HOME "$HOME/.local/share"
    set -x XDG_STATE_HOME "$HOME/.local/state"
    set -x XDG_SESSION_TYPE wayland
    set -x XDG_SESSION_DESKTOP Hyprland
    set -x XDG_CURRENT_DESKTOP Hyprland

    set -x XCURSOR_SIZE 20
    set -x XCURSOR_THEME Bibata-Modern-Classic

    set -x GDK_BACKEND "wayland,x11"
    set -x GTK_USE_PORTAL 1
    set -x QT_QPA_PLATFORM wayland

    set -x VISUAL helix
    set -x EDITOR helix
    set -x GOPATH "$HOME/.go"
    set -x BAT_THEME "ansi"
    set -x MOZ_ENABLE_WAYLAND 1

    source ~/.config/fish/secrets.fish
end
