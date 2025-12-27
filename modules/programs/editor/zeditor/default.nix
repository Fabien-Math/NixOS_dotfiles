{
  lib,
  pkgs,
  config,
  ...
}:

{
  home-manager.sharedModules = [
    (_: {
      programs.zed-editor = {
        enable = true;

        # Allow Zed to modify files on disk
        mutableUserSettings = true;
        mutableUserKeymaps = true;

        # -----------------------
        # settings.json
        # -----------------------
        userSettings = {
          assistant = {
            enabled = true;
            version = "2";
            default_open_ai_model = null;

            default_model = {
              provider = "zed.dev";
              model = "claude-3-5-sonnet-latest";
            };
          };

          terminal = {
            alternate_scroll = "off";
            blinking = "off";
            copy_on_select = false;
            dock = "bottom";

            detect_venv = {
              on = {
                directories = [ ".env" "env" ".venv" "venv" ];
                activate_script = "default";
              };
            };

            env = {
              TERM = "kitty";
            };

            font_family = "FiraCode Nerd Font";
            font_features = null;
            font_size = null;
            line_height = "comfortable";
            option_as_meta = false;
            button = false;
            shell = "system";

            toolbar = {
              title = true;
            };

            working_directory = "current_project_directory";
          };

          features = {
            copilot = false;
          };

          telemetry = {
            metrics = false;
          };

          active_pane_modifiers = {
            border_size = 0.0;
            inactive_opacity = 0.8;
          };

          # direnv + flakes
          load_direnv = "shell_hook";
          base_keymap = "VSCode";

          lsp = {
            nix = {
              binary = {
                path_lookup = true;
              };
            };
          };

          vim_mode = false;
          show_whitespaces = "none";

          hour_format = "hour24";
          auto_update = false;

          ui_font_size = 16;
          buffer_font_size = 16;

          theme = {
            mode = "dark";
            light = "One Light";
            dark = "One Dark";
          };
        };

        # -----------------------
        # keymap.json
        # -----------------------
        userKeymaps = [
          {
            context = "Workspace";
            bindings = {
              "ctrl-shift-t" = "workspace::NewTerminal";
              "ctrl-k ctrl-o" = "workspace::Open";
              "ctrl-o" = "workspace::OpenFiles";
            };
          }
          {
            context = "Editor";
            bindings = {
              "ctrl-:" = "editor::ToggleComments";
            };
          }
        ];

        # -----------------------
        # Extensions
        # -----------------------
        extensions = [
          "nix"
          "toml"
          "make"
          "python-snippets"
        ];
      };
    })
  ];
}
