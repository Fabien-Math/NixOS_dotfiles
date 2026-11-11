{ pkgs, ... }:
{
  # TODO: review
  programs = {
    fuse.userAllowOther = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # AppImage Support
    appimage-run # Needed For AppImage Support

    # Cursors & Themes
    bibata-cursors
    sddm-astronaut # Sddm Theme (Overlayed)

    # SDDM Dependencies
    kdePackages.qtmultimedia # Sddm Dependency
    kdePackages.qtsvg # Sddm Dependency
    kdePackages.qtvirtualkeyboard # Sddm Dependency
    # libsForQt5.qt5.qtgraphicaleffects # Sddm Dependency (Old)

    # System & Hardware Information
    lm_sensors # Used For Getting Hardware Temps
    lshw # Detailed Hardware Information
    # glxinfo # Needed For Inxi Diag Util
    # inxi # CLI System Information Tool
    # pciutils # Collection Of Tools For Inspecting PCI Devices
    socat # Utility for bidirectional data transfer between two independent data channels (Check Hyprland monitors changes)
    # usbutils # Good Tools For USB Devices

    # Disk & File Management
    duf # Utility For Viewing Disk Usage In Terminal
    # dysk # Disk Space Util, Nice Formatting
    gnome-disk-utility # Disk Partitioning and Mounting Utility
    # ncdu # Disk Usage Analyzer With Ncurses Interface
    unrar # Tool For Handling .rar Files
    unzip # Tool For Handling .zip Files

    # Terminal Utilities
    fd # Better Find
    fzf # Fuzzy Finder
    jq # JSON Formatting Utility
    killall # For Killing All Instances Of Programs
    microfetch # Small Fetch (Blazingly Fast)
    ripgrep # Improved Grep
    bashInteractive # Ensure bash is interactive
    # zoxide # Fast Directory Jumping (z/cd Replacement)

    # Networking & Downloads
    dig # Network Debugging
    wget # Tool For Fetching Files With Links
    # gh # GitHub Authentication Client

    # Nix & Development Tools
    git # Git
    nix-prefetch-scripts # Find Hashes/Revisions Of Nix Packages
    # nixfmt-rfc-style # Nix Formatter
    # pkg-config # Wrapper Script For Allowing Packages To Get Info On Others
    # devenv
    # devbox
    # shellify

    # Programming & Python
    ruff # Python Linting And Formatting

    # Documents & File Conversion
    pandoc # Universal Document Converter

    # Multimedia & Graphics
    ffmpeg # Terminal Video / Audio Editing
    libjxl # Support For JXL Images
    mpv # Incredible Video Player
    # picard # For Changing Music Metadata & Getting Cover Art
    # rhythmbox # Audio Player
    # v4l-utils # Used For Things Like OBS Virtual Camera
    # ytmdl # Tool For Downloading Audio From YouTube

    # Audio
    pavucontrol # For Editing Audio Levels & Devices

    # Desktop & Wayland
    libnotify # For Notifications
    uwsm # Universal Wayland Session Manager (Optional, Must Be Enabled)
    # nwg-displays # Configure Monitor Configs Via GUI

    # Documentation
    tldr # Improved Man

  ];
}
