{ pkgs, ... }:
pkgs.writeShellScriptBin "changelayout" ''
	#!/usr/bin/env bash

	current=$(hyprctl getoption general:layout -j | jq -r '.str')

	if [ "$current" = "scrolling" ]; then
	    hyprctl keyword general:layout dwindle
			notify-send "Hyprland" "Switched to dwindle layout"
	else
	    hyprctl keyword general:layout scrolling
			notify-send "Hyprland" "Switched to scrolling layout"
	fi
''
