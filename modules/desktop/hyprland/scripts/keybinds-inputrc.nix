{ pkgs, ... }:

pkgs.writeShellScriptBin "keybinds-inputrc-yad" ''
  # Close existing YAD windows
  ${pkgs.procps}/bin/pkill -x yad 2>/dev/null

  ${pkgs.yad}/bin/yad \
    --center \
    --title="Bash / Readline Keybindings" \
    --width=700 \
    --height=820 \
    --list \
    --no-buttons \
    --column="Key" \
    --column="Description" \
    --column="Action" \
    --timeout-indicator=bottom \
    "" "" "" \
    "───────────────" "HISTORY SEARCH" "───────────────" \
    "" "" "" \
    "↑" "Search backward (by typed prefix)" "history-search-backward" \
    "↓" "Search forward (by typed prefix)" "history-search-forward" \
    "Page Up" "Search backward" "history-search-backward" \
    "Page Down" "Search forward" "history-search-forward" \
    "" "" "" \
    "───────────────" "CURSOR MOVEMENT" "───────────────" \
    "" "" "" \
    "Home" "Beginning of line" "beginning-of-line" \
    "End" "End of line" "end-of-line" \
    "Ctrl →" "Forward one word" "forward-word" \
    "Ctrl ←" "Backward one word" "backward-word" \
    "Alt →" "Forward one word" "forward-word" \
    "Alt ←" "Backward one word" "backward-word" \
    "" "" "" \
    "───────────────" "EDITING" "───────────────" \
    "" "" "" \
    "Delete" "Delete character under cursor" "delete-char" \
    "Ctrl H" "Delete previous character" "backward-delete-char" \
    "Ctrl W" "Delete previous word" "unix-word-rubout" \
    "Alt Backspace" "Delete previous word" "backward-kill-word" \
    "Ctrl X Ctrl E" "Edit command in \$EDITOR" "edit-and-execute-command" \
    "" "" "" \
    "───────────────" "COMPLETION" "───────────────" \
    "" "" "" \
    "Tab" "Auto-complete" "complete" \
    "Shift Tab" "Reverse menu completion" "menu-complete-backward" \
    "" "" "" \
    "───────────────" "ARGUMENT / HISTORY HELPERS" "───────────────" \
    "" "" "" \
    "Alt ." "Insert last argument of previous command" "yank-last-arg" \
    "" "" "" \
    "───────────────" "PASTE BEHAVIOR" "───────────────" \
    "" "" "" \
    "Bracketed Paste" "Safe multi-line paste mode" "enable-bracketed-paste" \
    "" "" "" \
''
