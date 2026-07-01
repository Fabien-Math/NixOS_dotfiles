{ pkgs, ... }:

pkgs.writeShellScriptBin "keybinds-kitty-yad" ''
  # Close existing YAD windows
  ${pkgs.procps}/bin/pkill -x yad 2>/dev/null

  ${pkgs.yad}/bin/yad \
    --center \
    --title="Kitty Terminal Keybindings" \
    --width=760 \
    --height=860 \
    --list \
    --no-buttons \
    --column="Key" \
    --column="Description" \
    --column="Action" \
    --timeout-indicator=bottom \
    "" "" "" \
    "───────────────" "WINDOW MANAGEMENT" "───────────────" \
    "" "" "" \
    "Ctrl+Shift+Enter" "New window (same OS window)" "new_window" \
    "Ctrl+Shift+Space" "New window (same OS window)" "new_window" \
    "Ctrl+Shift+N" "New OS window" "new_os_window" \
    "Ctrl+Shift+W" "Close window" "close_window" \
    "Ctrl+Shift+Q" "Close OS window" "close_os_window" \
    "" "" "" \
    "───────────────" "TAB MANAGEMENT" "───────────────" \
    "" "" "" \
    "Ctrl+Shift+T" "New tab" "new_tab" \
    "Ctrl+Tab" "Next tab" "next_tab" \
    "Ctrl+Shift+Tab" "Previous tab" "previous_tab" \
    "Ctrl+Shift+L" "Next layout" "next_layout" \
    "" "" "" \
    "───────────────" "SPLITS / LAYOUT" "───────────────" \
    "" "" "" \
    "Ctrl+Shift+Left" "Next window in layout" "next_window" \
    "Ctrl+Shift+Right" "Previous window in layout" "previous_window" \
    "Ctrl+Shift+F" "Move window forward" "move_window_forward" \
    "Ctrl+Shift+B" "Move window backward" "move_window_backward" \
    "" "" "" \
    "───────────────" "FONT SIZE" "───────────────" \
    "" "" "" \
    "Ctrl+Shift++" "Increase font size" "increase_font_size" \
    "Ctrl+Shift+-" "Decrease font size" "decrease_font_size" \
    "Ctrl+Shift+Backspace" "Reset font size" "reset_font_size" \
    "" "" "" \
    "───────────────" "SCROLLING" "───────────────" \
    "" "" "" \
    "Ctrl+Shift+Up" "Scroll line up" "scroll_line_up" \
    "Ctrl+Shift+Down" "Scroll line down" "scroll_line_down" \
    "Ctrl+Shift+PageUp" "Scroll page up" "scroll_page_up" \
    "Ctrl+Shift+PageDown" "Scroll page down" "scroll_page_down" \
    "Ctrl+Shift+Home" "Scroll to top" "scroll_home" \
    "Ctrl+Shift+End" "Scroll to bottom" "scroll_end" \
    "" "" "" \
    "───────────────" "CLIPBOARD / SELECTION" "───────────────" \
    "" "" "" \
    "Ctrl+Shift+C" "Copy to clipboard" "copy_to_clipboard" \
    "Ctrl+Shift+V" "Paste from clipboard" "paste_from_clipboard" \
    "Ctrl+Shift+S" "Paste from selection" "paste_from_selection" \
    "" "" "" \
    "───────────────" "MISC" "───────────────" \
    "" "" "" \
    "Ctrl+Shift+R" "Reload config (kitty.conf)" "reload_config" \
    "Ctrl+Shift+F2" "Open kitty shell" "kitty_shell" \
    "" "" "" \
''
