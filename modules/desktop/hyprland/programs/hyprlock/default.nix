
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
            no_fade_in = false;
            grace = 0;
            disable_loading_bar = false;
            hide_cursor = true;
          };

          background = [
            {
              monitor = "";
              path = "${../../../../themes/wallpapers/${hyprlockWallpaper}}";
              # blur_passes = 0;
              # contrast = 0.8916;
              # brightness = 0.8172;
              # vibrancy = 0.1696;
              # vibrancy_darkness = 0.0;
            }
          ];

          label = [
            # GREETINGS
            # {
            #   monitor = "";
            #   text = "Welcome!";
            #   color = "rgba(205, 214, 224, 0.75)";
            #   font_size = 55;
            #   font_family = "JetBrainsMono Nerd Font";
            #   position = "165, 320";
            #   halign = "left";
            #   valign = "center";
            # }

            # TIME
            {
              monitor = "";
              text = "cmd[update:1000] echo \"<span>$(date +\"%H:%M\")</span>\"";
              color = "rgba(205, 214, 224, 0.75)";
              font_size = 40;
              font_family = "JetBrainsMono Nerd Font";
              position = "255, 240";
              halign = "left";
              valign = "center";
            }

            # DAY-MONTH-DATE
            {
              monitor = "";
              text = ''cmd[update:60000] echo -e "$(date +"%A, %B %-d")"'';
              color = "rgba(205, 214, 224, 0.75)";
              font_size = 20;
              text_align = "left";
              font_family = "JetBrainsMono Nerd Font";
              position = "180, 175";
              halign = "left";
              valign = "center";
            }


          ];

          # INPUT FIELD
          input-field = [
            {
              monitor = "";
              size = "320, 55";
              outline_thickness = 0;
              dots_size = 0.15;
              dots_spacing = 0.2;
              dots_center = true;
              outer_color = "rgba(255, 255, 255, 0)";
              inner_color = "rgba(255, 255, 255, 0.1)";
              font_color = "rgba(160, 160, 160, 1)";
              fail_color = "rgba(255, 255, 255, 0.1)";
              check_color = "rgba(255, 255, 255, 0.1)";
              capslock_color = "rgba(255, 255, 255, 0.1)";
              numlock_color = "rgba(255, 255, 255, 0.1)";
              bothlock_color = "rgba(255, 255, 255, 0.1)";
              fail_transition = 100;
              fade_on_empty = false;
              font_family = "JetBrainsMono Nerd Font";
              placeholder_text = "$USER";
              hide_input = false;
              position = "170, -220";
              halign = "left";
              valign = "center";
            }
          ];
        };
      };
    })
  ];
}
