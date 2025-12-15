{ host, ... }:
let
  inherit (import ../../../../../hosts/${host}/variables.nix) hyprlockWallpaper;
in
{
  home-manager.sharedModules = [
    (_: {
      programs.hyprlock = {
        enable = true;
        settings = {
          general = {
            hide_cursor = true;
          };

          background = [
            {
              monitor = "";
              color = "rgb(36, 39, 58)";
              path = "${../../../../themes/wallpapers/${hyprlockWallpaper}}";

              new_optimizations = true;
              # blur_size = 3;
              # blur_passes = 2;
              # noise = 0.0117;
              contrast = 1.000;
              brightness = 1.0000;
              vibrancy = 0.2100;
              vibrancy_darkness = 0.0;
            }
          ];

          input-field = [
            {
              monitor = "";
              size = "250, 50";
              outline_thickness = 3;
              outer_color = "rgba(160, 206, 246, 1)";
              inner_color = "rgb(36, 39, 58)";
              font_color = "rgba(160, 206, 246, 1)";
              fail_color = "rgb(237, 135, 150)";
              fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
              fail_transition = 300;
              fade_on_empty = false;
              placeholder_text = "Password...";
              dots_size = 0.2;
              dots_spacing = 0.64;
              dots_center = true;
              position = "0, 140";
              halign = "center";
              valign = "bottom";
            }
          ];

          label = [
            {
              monitor = "";
              # text = "cmd[update:1000] echo \"<b><big> $(date +\"%H:%M:%S\") </big></b>\"";
              text = "$TIME";
              font_size = 64;
              color = "rgb(160, 206, 246)";
              position = "0, 36";
              valign = "center";
              halign = "center";
            }
            {
              monitor = "";
              text = "Hello <span text_transform=\"capitalize\" size=\"larger\">$USER!</span>";
              color = "rgb(160, 206, 246)";
              font_size = 20;
              position = "0, 120";
              halign = "center";
              valign = "center";
            }
            # {
            #   monitor = "";
            #   text = "Current Layout : $LAYOUT";
            #   color = "rgb(160, 206, 246)";
            #   font_size = 14;
            #   position = "0, 20";
            #   halign = "center";
            #   valign = "bottom";
            # }
            /*
                 {
                monitor = "";
                text = "Enter your password to unlock.";
                color = "rgb(198, 160, 246)";
                font_size = 14;
                position = "0, 60";
                halign = "center";
                valign = "bottom";
              }
            */
          ];
        };
      };
    })
  ];
}