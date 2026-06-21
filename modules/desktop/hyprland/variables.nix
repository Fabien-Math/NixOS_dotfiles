{
  host,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) getExe;
  inherit (import ../../../hosts/${host}/variables.nix)
    browser
    terminal
    kbdLayout
    kbdVariant
    defaultWallpaper
    ;

  # Import script modules
  # autowaybar = pkgs.callPackage ./scripts/autowaybar.nix { };
  autoclicker = pkgs.callPackage ./scripts/autoclicker.nix { };
  batterynotify = pkgs.callPackage ./scripts/batterynotify.nix { };
  clipmanager = pkgs.callPackage ./scripts/clipmanager.nix { };
  gamemode = pkgs.callPackage ./scripts/gamemode.nix { };
  keyboardswitch = pkgs.callPackage ./scripts/keyboardswitch.nix { };
  monitorswitch = pkgs.callPackage ./scripts/monitorswitch.nix { };
  keybinds-yad = pkgs.callPackage ./scripts/keybinds-yad.nix { };
  keybinds-inputrc = pkgs.callPackage ./scripts/keybinds-inputrc.nix { };
  keybinds-kitty = pkgs.callPackage ./scripts/keybinds-kitty.nix { };

  # keybinds-rofi = pkgs.callPackage ./scripts/keybinds-yad.nix { };
  # mediactrl = pkgs.callPackage ./scripts/mediactrl.nix { };
  rofimusic = pkgs.callPackage ./scripts/rofimusic.nix { };
  screen-record = pkgs.callPackage ./scripts/screen-record.nix { };
  screenshot = pkgs.callPackage ./scripts/screenshot.nix { };
  wallpaper = pkgs.callPackage ./scripts/wallpaper.nix { inherit defaultWallpaper; };
  zoom = pkgs.callPackage ./scripts/zoom.nix { };

  launcher = pkgs.callPackage ../../scripts/launcher.nix { inherit lib pkgs terminal; };
in
{
  home-manager.sharedModules = [
    (
      { config, ... }:
      {
        xdg.configFile."hypr/variables.lua" = {
          text = ''
            -- Scripts
            autoclicker = "${getExe autoclicker}"
            batterynotify = "${getExe batterynotify}"
            clipmanager = "${getExe clipmanager}"
            gamemode = "${getExe gamemode}"
            keyboardswitch = "${getExe keyboardswitch}"
            keybinds_yad = "${getExe keybinds-yad}"
            rofimusic = "${getExe rofimusic}"
            screen_record = "${getExe screen-record}"
            screenshot = "${getExe screenshot}"
            monitorswitch = "${getExe monitorswitch}"
            wallpaper = "${getExe wallpaper}"
            zoom = "${getExe zoom}"

            mainMod = "SUPER"
            launcher = "${getExe launcher}"
            bar = "waybar"
            term = "${terminal}"
            editor = "zeditor"
            code_editor = "code"
            browser = "${browser}"
            fileManager = "exec ${terminal} -e yazi"
            kbdLayout = "${kbdLayout}"
            kbdVariant = "${kbdVariant}"
          '';
        };
      }
    )
  ];
}
