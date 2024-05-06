#!/usr/bin/env fish

set artist $(playerctl metadata --format '{{artist}}')
set title $(playerctl metadata --format '{{title}}')
set player_status "$(playerctl status --no-messages)"

if test -z "$artist" -o -z "$title"
    set txt "$player_status 󰎉 $title$artist"
else if test -n "$artist" -a -n "$title"
    set txt "$player_status 󰎉 $artist | $title"
else if test "$player_status" = Stopped
    set txt ""
end

set tt $txt

# cut off strings longer than 64 chars
if test $(string length $txt) -gt 64
    set txt "$(echo $txt | cut -c -61)..."
end

# escape > and <
set txt $(string replace '<' '\<' $txt)
set tt $(string replace '<' '\<' $tt)

set txt $(string replace '>' '\>' $txt)
set tt $(string replace '>' '\>' $tt)

echo "$txt"
echo "$tt"
echo ""
