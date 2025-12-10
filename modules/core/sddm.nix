{
  pkgs,
  lib,
  host,
  ...
}:
let
  inherit (import ../../hosts/${host}/variables.nix) sddmTheme;
  inherit (import ../../hosts/${host}/variables.nix) sddmWallpaper;

  # --- SDDM Astronaut Theme Override ---
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "${sddmTheme}";
    themeConfig =
      if lib.hasSuffix "black_hole" sddmTheme then
        {
          ScreenPadding = "";
          FormPosition = "center"; # left, center, right
        }
      else if lib.hasSuffix "astronaut" sddmTheme then
        {
          PartialBlur = "false";
          FormPosition = "center"; # left, center, right
        }
      else if lib.hasSuffix "purple_leaves" sddmTheme then
        {
          PartialBlur = "false";
        }
      else
        { };
  };

  # --- Custom Background using runCommand ---
  # background-package = pkgs.runCommand "background-image" {} ''
  #   cp "./../../hosts/${host}/wallpapers/${sddmWallpaper}.jxl" $out
  # '';

  # background-package = pkgs.stdenvNoCC.mkDerivation {
  #   name = "background-image";
  #   src = "./../../hosts/${host}/wallpapers";
  #   dontUnpack = true;
  #   installPhase = ''
  #     cp $src/${sddmWallpaper}.jxl $out
  #   '';
  # };

in
{
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      enableHidpi = true;
      package = pkgs.kdePackages.sddm;
      extraPackages = [
        sddm-astronaut
        pkgs.kdePackages.qtsvg
        pkgs.kdePackages.qtmultimedia
        pkgs.kdePackages.qtvirtualkeyboard
      ];
      settings.Theme.CursorTheme = "Bibata-Modern-Classic";
      theme = "sddm-astronaut-theme";
    };
  };

  environment.systemPackages = [
    sddm-astronaut
    pkgs.kdePackages.qtsvg
    pkgs.kdePackages.qtmultimedia
    pkgs.kdePackages.qtvirtualkeyboard

    # # Theme override to set background
    # (pkgs.writeTextDir "share/sddm/themes/sddm-astronaut-theme/theme.conf.user" ''
    #   [General]
    #   background = "${background-package}"
    # '')
  ];
}
