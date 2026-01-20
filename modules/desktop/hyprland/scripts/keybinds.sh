#!/usr/bin/env bash

if pidof rofi >/dev/null; then
  pkill rofi
fi

if pidof yad >/dev/null; then
  pkill yad
fi

# get_nix_value() {
#     grep "$1" "$HOME/NixOS/flake.nix" | sed -E 's/.*"([^"]+)".*/\1/'
# }
get_nix_value() {
    awk '
    /settings = {/ {inside_settings=1; next}
    inside_settings && /}/ {inside_settings=0}
    inside_settings && $0 ~ key {print gensub(/.*"([^"]+)".*/, "\\1", "g", $0)}
    ' key="$1" "$HOME/NixOS/flake.nix"
}


_browser=$(get_nix_value "browser =")
_terminal=$(get_nix_value "terminal =")
_terminal_FM=$(get_nix_value "tuiFileManager =")
_editor=$(get_nix_value "editor =")
_secondary_editor=$(get_nix_value "secondaryEditor =")


yad \
  --center \
  --title="Hyprland Keybinds" \
  --no-buttons \
  --list \
  --width=650 \
  --height=920 \
  --column=Key: \
  --column=Description: \
  --column=Command: \
  --timeout-indicator=bottom \
  "" "" "" \
  "────────────────────" "KEYBIND HELP" "────────────────────" \
  "" "" "" \
  "SUPER CTRL K" "Open keybinds menu" "scripts/keybinds.sh" \
  "" "" "" \
  "────────────────────" "APPLICATION LAUNCHERS" "────────────────────" \
  "" "" "" \
  "SUPER Return" "Launch terminal" "$_terminal" \
  "SUPER T" "Launch terminal" "$_terminal" \
  "SUPER E" "Launch file manager" "$_terminal_FM" \
  "SUPER F" "Launch browser" "$_browser" \
  "SUPER Z" "Launch primary editor" "$_editor" \
  "SUPER C" "Launch secondary editor" "$_secondary_editor" \
  "SUPER Shift S" "Launch Spotify" "spotify" \
  "SUPER A" "Application launcher" "scripts/launcher drun" \
  "SUPER Space" "Application launcher" "scripts/launcher drun" \
  "SUPER Shift W" "Wallpaper menu" "scripts/launcher wallpaper" \
  "SUPER Shift T" "TMUX sessions" "scripts/launcher tmux" \
  "SUPER G" "Game launcher" "scripts/launcher games" \
  "SUPER Shift Z" "Emoji picker" "scripts/launcher emoji" \
  "" "" "" \
  "────────────────────" "SYSTEM - SESSION" "────────────────────" \
  "" "" "" \
  "CTRL ALT Delete" "System monitor" "$_terminal -e btop" \
  "SUPER Delete" "Exit Hyprland" "exit" \
  "SUPER Backspace" "Power menu" "wlogout -b 4" \
  "SUPER ALT L" "Lock screen" "hyprlock" \
  "CTRL Escape" "Toggle Waybar" "pkill waybar || waybar" \
  "SUPER U" "Rebuild system" "$_terminal -e rebuild" \
  "SUPER F8" "Toggle autoclicker" "autoclicker (PID toggle)" \
  "XF86 Sleep" "Suspend system" "systemctl suspend" \
  "XF86 Sleep" "Suspend system" "systemctl suspend" \
  "" "" "" \
  "────────────────────" "WINDOW MANAGEMENT" "────────────────────" \
  "" "" "" \
  "SUPER W" "Toggle floating" "togglefloating" \
  "ALT Return" "Toggle fullscreen" "fullscreen" \
  "SUPER Q" "Close active window" "scripts/dontkillsteam.sh" \
  "ALT F4" "Close active window" "scripts/dontkillsteam.sh" \
  "SUPER Shift G" "Toggle window group" "togglegroup" \
  "SUPER Shift Tab" "Toggle split / float" "togglesplit" \
  "SUPER + Left Click" "Move window (mouse)" "movewindow" \
  "SUPER + Right Click" "Resize window (mouse)" "resizewindow" \
  "SUPER SHIFT CTRL ←" "Move window left" "movewindow l" \
  "SUPER SHIFT CTRL →" "Move window right" "movewindow r" \
  "SUPER SHIFT CTRL ↑" "Move window up" "movewindow u" \
  "SUPER SHIFT CTRL ↓" "Move window down" "movewindow d" \
  "SUPER SHIFT CTRL H" "Move window left (HJKL)" "movewindow l" \
  "SUPER SHIFT CTRL L" "Move window right (HJKL)" "movewindow r" \
  "SUPER SHIFT CTRL K" "Move window up (HJKL)" "movewindow u" \
  "SUPER SHIFT CTRL J" "Move window down (HJKL)" "movewindow d" \
  "" "" "" \
  "────────────────────" "WINDOW RESIZE (ARROWS)" "────────────────────" \
  "" "" "" \
  "SUPER Shift →" "Resize right" "resizeactive 30 0" \
  "SUPER Shift ←" "Resize left" "resizeactive -30 0" \
  "SUPER Shift ↑" "Resize up" "resizeactive 0 -30" \
  "SUPER Shift ↓" "Resize down" "resizeactive 0 30" \
  "SUPER Shift L" "Resize right" "resizeactive 30 0" \
  "SUPER Shift H" "Resize left" "resizeactive -30 0" \
  "SUPER Shift K" "Resize up" "resizeactive 0 -30" \
  "SUPER Shift J" "Resize down" "resizeactive 0 30" \
  "" "" "" \
  "────────────────────" "WORKSPACES" "────────────────────" \
  "" "" "" \
  "SUPER 1–0" "Switch workspace" "workspace 1-10" \
  "SUPER Shift 1–0" "Move window" "movetoworkspace 1-10" \
  "SUPER é \" ' ( - è _ ç à" "Switch workspace (AZERTY)" "workspace 1–10" \
  "SUPER Shift é \" ' ( - è _ ç à" "Move window (AZERTY)" "movetoworkspace 1–10" \
  "SUPER CTRL é \" ' ( - è _ ç à" "Silent move (AZERTY)" "movetoworkspacesilent 1–10" \
  "SUPER CTRL →" "Next workspace" "workspace r+1" \
  "SUPER CTRL ←" "Previous workspace" "workspace r-1" \
  "SUPER CTRL ↓" "First empty workspace" "workspace empty" \
  "" "" "" \
  "────────────────────" "MOUSE WORKSPACES" "────────────────────" \
  "" "" "" \
  "SUPER Scroll Down" "Next workspace" "workspace e+1" \
  "SUPER Scroll Up" "Previous workspace" "workspace e-1" \
  "SUPER Mouse Button 276" "Go to workspace 5" "workspace 5" \
  "SUPER Mouse Button 275" "Go to workspace 6" "workspace 6" \
  "SUPER Shift Mouse 276" "Move window to workspace 5" "movetoworkspace 5" \
  "SUPER Shift Mouse 275" "Move window to workspace 6" "movetoworkspace 6" \
  "SUPER Ctrl Mouse 276" "Silent move to workspace 5" "movetoworkspacesilent 5" \
  "SUPER Ctrl Mouse 275" "Silent move to workspace 6" "movetoworkspacesilent 6" \
  "" "" "" \
  "────────────────────" "SCRATCHPAD" "────────────────────" \
  "" "" "" \
  "SUPER CTRL S" "Move to scratchpad" "movetoworkspacesilent special" \
  "SUPER ALT S" "Move to scratchpad (silent)" "movetoworkspacesilent special" \
  "SUPER S" "Toggle scratchpad" "togglespecialworkspace" \
  "" "" "" \
  "────────────────────" "SCREENSHOT - RECORDING" "────────────────────" \
  "" "" "" \
  "SUPER P" "Screenshot (area)" "scripts/screenshot.sh s" \
  "SUPER CTRL P" "Screenshot (frozen)" "scripts/screenshot.sh sf" \
  "SUPER Print" "Screenshot (monitor)" "scripts/screenshot.sh m" \
  "SUPER ALT P" "Screenshot (all)" "scripts/screenshot.sh p" \
  "SUPER Shift R" "Record (area)" "scripts/screen-record.sh a" \
  "SUPER CTRL R" "Record (monitor)" "scripts/screen-record.sh m" \
  "" "" "" \
  "────────────────────" "MEDIA - HARDWARE" "────────────────────" \
  "" "" "" \
  "XF86 Brightness ↓" "Decrease brightness" "brightnessctl set 2%-" \
  "XF86 Brightness ↑" "Increase brightness" "brightnessctl set +2%" \
  "XF86 Audio ↓" "Volume down" "pamixer -d 2" \
  "XF86 Audio ↑" "Volume up" "pamixer -i 2%" \
  "XF86 Audio Mute" "Mute audio" "pamixer -t" \
  "XF86 Mic Mute" "Mute microphone" "pamixer --default-source -t" \
  "XF86 Play" "Play / Pause" "playerctl play-pause" \
  "XF86 Pause" "Play / Pause media" "playerctl play-pause" \
  "XF86 Next" "Next track" "playerctl next" \
  "XF86 Prev" "Previous track" "playerctl previous" \
  "" "" "" \
