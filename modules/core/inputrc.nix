{ pkgs, ... }:
{
environment.etc."inputrc".text = ''
# /etc/inputrc - optimized for kitty terminal
#####
# General behavior
#####

# 8-bit support
set input-meta on
set output-meta on
set convert-meta off

# Editing mode
set editing-mode emacs

# No annoying bell
set bell-style none

# Faster key sequence recognition
set keyseq-timeout 250

# Enable bracketed paste (kitty supports this perfectly)
set enable-bracketed-paste on

#####
# Completion improvements
#####

set completion-ignore-case on
set completion-map-case on
set show-all-if-ambiguous off
set show-all-if-unmodified off
set menu-complete-display-prefix on
set colored-stats on
set visible-stats on
set mark-symlinked-directories on

#####
# History behavior
#####

# Arrow up/down search history by prefix (much better UX)
"\e[A": history-search-backward
"\e[B": history-search-forward

# Page Up / Page Down also search history
"\e[5~": history-search-backward
"\e[6~": history-search-forward

#####
# Modern kitty key sequences
#####

# Ctrl + Left / Right
"\e[1;5C": forward-word
"\e[1;5D": backward-word

# Alt + Left / Right
"\e[1;3C": forward-word
"\e[1;3D": backward-word

# Home / End
"\e[H": beginning-of-line
"\e[F": end-of-line
"\eOH": beginning-of-line
"\eOF": end-of-line

# Delete / Insert
"\e[3~": delete-char
"\e[2~": quoted-insert

# Shift+Tab (reverse completion)
"\e[Z": menu-complete-backward

#####
# Productivity bindings
#####

# Alt + . → insert last argument
"\e.": yank-last-arg

# Ctrl-x Ctrl-e → edit command in $EDITOR
"\C-x\C-e": edit-and-execute-command

# Better word deletion
"\e\C-h": backward-kill-word
"\C-w": unix-word-rubout
'';
}
