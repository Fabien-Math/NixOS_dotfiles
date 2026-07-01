{ lib, ... }:
let
  vars = import ./variables.nix;
in
{
  imports = [
    ./hardware-configuration.nix
    ./host-packages.nix

    # Core Modules (Don't change unless you know what you're doing)
    ../../modules/scripts
    ../../modules/core/boot.nix
    ../../modules/core/bash.nix
    ../../modules/core/zsh.nix
    ../../modules/core/starship.nix
    ../../modules/core/fonts.nix
    ../../modules/core/hardware.nix
    ../../modules/core/network.nix
    ../../modules/core/dns.nix
    ../../modules/core/nh.nix
    ../../modules/core/packages.nix
    ../../modules/core/printing.nix
    ../../modules/core/sddm.nix
    ../../modules/core/security.nix
    ../../modules/core/services.nix
    ../../modules/core/system.nix
    ../../modules/core/users.nix
    ../../modules/core/virtualisation.nix

    # Optional
    ../../modules/hardware/drives # Automatically mount extra external/internal drives
    ../../modules/hardware/video/${vars.videoDriver}.nix # Enable gpu drivers defined in variables.nix
    ../../modules/desktop/${vars.desktop} # Set window manager defined in variables.nix
    ../../modules/programs/browser/${vars.browser} # Set browser defined in variables.nix
    ../../modules/programs/terminal/${vars.terminal} # Set terminal defined in variables.nix
    ../../modules/programs/editor/${vars.editor} # Set editor defined in variables.nix
    ../../modules/programs/editor/${vars.secondaryEditor} # Set editor defined in variables.nix
    ../../modules/programs/cli/${vars.tuiFileManager} # Set file-manager defined in variables.nix
    ../../modules/programs/cli/tmux
    ../../modules/programs/cli/direnv
    ../../modules/programs/cli/lazygit
    ../../modules/programs/cli/cava
    # ../../modules/programs/cli/fastfetch
    ../../modules/programs/cli/btop
    ../../modules/programs/media/discord
    ../../modules/programs/media/spicetify
    ../../modules/programs/media/thunderbird
    ../../modules/programs/media/obs-studio
    ../../modules/programs/media/mpv
    ../../modules/programs/misc/tlp
    ../../modules/programs/misc/thunar
    ../../modules/programs/misc/lact # GPU fan, clock and power configuration
  ]
  ;

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
