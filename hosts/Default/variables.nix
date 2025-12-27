{
  # User Configuration
  username = "fabien"; # Your username (auto-set with install.sh, live-install.sh, rebuild)

  # Desktop Environment
  desktop = "hyprland"; # Option: hyprland

  # Theme & Appearance
  sddmTheme = "astronaut"; # Options: astronaut, black_hole, purple_leaves, jake_the_dog, hyprland_kath
  hyprlockWallpaper = "train-sideview.webp";
  defaultWallpaper = "evening-sky.webp"; # Change with SUPER + SHIFT + W

  # Default Applications
  shell = "bash"; # Options: zsh, bash
  terminal = "kitty"; # Option: kitty
  editor = "zeditor"; # Options: vscode, nvchad, neovim
  secondaryEditor = "vscode"; # Options: vscode, nvchad, neovim, zeditor
  browser = "firefox"; # Option: firefox
  tuiFileManager = "yazi"; # Option: yazi
  games = false; # Whether to enable the gaming module

  # Hardware
  videoDriver = "amdgpu"; # CRITICAL: Choose your GPU driver (nvidia, amdgpu, intel)
  hostname = "fabien"; # Your system hostname

  # Localization
  clock24h = true; # 24H or 12H clock in waybar
  locale = "en_GB.UTF-8"; # System locale
  timezone = "Europe/Paris"; # Your timezone
  kbdLayout = "fr"; # Keyboard layout
  kbdVariant = "latin9"; # Keyboard variant (can be empty)
  consoleKeymap = "fr"; # TTY keymap
}
