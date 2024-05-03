#!/usr/bin/env fish

set artist $(playerctl metadata --format '{{artist}}')
set title $(playerctl metadata --format '{{title}}')

if test "$artist" = "" -a "$title" != ""
    set txt "$(playerctl status --no-messages) 󰎉 $title"
else if test "$artist" != "" -a "$title" = ""
    set txt "$(playerctl status --no-messages) 󰎉 $artist"
else if test "$artist" != "" -a "$title" != ""
    set txt "$(playerctl status --no-messages) 󰎉 $artist | $title"
else
    set txt "$(playerctl status --no-messages) 󰎉"
end

set tt $txt

# cut off strings longer than 64 chars
if test $(string length $txt) -gt 64
    set txt "$(echo $txt | cut -c -61)..."
else if [ "$txt" = " 󰎉" ]
    set txt "No Media Playing 󰎉 :("
end

# escape > and <
set txt $(string replace '<' '\<' $txt)
set tt $(string replace '<' '\<' $tt)

set txt $(string replace '>' '\>' $txt)
set tt $(string replace '>' '\>' $tt)

echo "$txt"
echo "$tt"
echo ""
