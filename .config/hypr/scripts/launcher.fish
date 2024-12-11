#!/usr/bin/env fish

# close if open, then exit
set class "class: io.otsaloma.catapult"
set catapult_client "$(hyprctl clients | grep $class)"

echo $catapult_client

if test $(string trim "$catapult_client") = "$class"
    hyprctl dispatch closewindow io.otsaloma.catapult
    catapult --hide
    exit
end

catapult
