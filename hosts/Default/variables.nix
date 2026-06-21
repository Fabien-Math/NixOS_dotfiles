{
  username = "fabien"; # auto-set with install.sh, live-install.sh, and rebuild scripts.

  # Desktop Environment
  desktop = "hyprland"; # hyprland, i3, gnome, plasma6

  # Theme & Appearance
  bar = "minimal"; # stylish, minimal
  sddmTheme = "astronaut"; # astronaut, black_hole, purple_leaves, jake_the_dog, hyprland_kath
  defaultWallpaper = "lets_go_home.jpg"; # Change with SUPER + SHIFT + W
  hyprlockWallpaper = "storm.jpg";

  # Default Applications
  shell = "bash"; # Options: zsh, bash
  terminal = "kitty"; # Option: kitty
  editor = "zeditor"; # Options: vscode, nvchad, neovim, zeditor
  secondaryEditor = "vscode"; # Options: vscode, nvchad, neovim, zeditor
  browser = "firefox"; # Option: firefox
  tuiFileManager = "yazi"; # Option: yazi

  # Hardware
  hostname = "fabien";
  videoDriver = "nvidia"; # nvidia, amdgpu, intel
  nvidiaChannel = "stable"; # stable, latest, beta, legacy_xxx

  # Localization
  timezone = "Europe/Paris";
  locale = "en_GB.UTF-8";
  clock24h = true;
  kbdLayout = "fr";
  kbdVariant = "latin9";
  consoleKeymap = "fr";
}
