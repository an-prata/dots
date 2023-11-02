#!/usr/bin/env bash

if [ -f "/tmp/floating" ]; then
	if [ "$1" == "get" ]; then
		echo "Floating"
		exit
	fi
	
	hyprctl keyword windowrule 'tile,title:.*'
	rm /tmp/floating
	echo 'set tiling'
else
	if [ "$1" == "get" ]; then
		echo "Tiling"
		exit
	fi
	
	hyprctl keyword windowrule 'float,title:.*'
	touch /tmp/floating
	echo 'set floating'
fi



