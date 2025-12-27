{
  lib,
  pkgs,
  ...
}:
{
  home-manager.sharedModules = [
    (_: {
        programs.zed-editor = {
          enable = true;

          mutableUserSettings = mkOption {
            type = types.bool;
            default = true;
            example = false;
            description = ''
              Whether user settings (settings.json) can be updated by zed.
            '';
          };

          mutableUserKeymaps = mkOption {
            type = types.bool;
            default = true;
            example = false;
            description = ''
              Whether user keymaps (keymap.json) can be updated by zed.
            '';
          };

          userSettings = mkOption {
            type = jsonFormat.type;
            default = { };
            example = literalExpression ''
              {
                assistant = {
                  enabled = true;
                  version = "2";
                  default_open_ai_model = null;

                  # Provider options:
                  # - zed.dev models (claude-3-5-sonnet-latest) requires GitHub connected
                  # - anthropic models (claude-3-5-sonnet-latest, claude-3-haiku-latest, claude-3-opus-latest) requires API_KEY
                  # - copilot_chat models (gpt-4o, gpt-4, gpt-3.5-turbo, o1-preview) requires GitHub connected
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

                # Tell Zed to use direnv and direnv can use a flake.nix environment
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
                show_whitespaces = "all";

                hour_format = "hour24";
                auto_update = false;

                ### Theme
                ui_font_size = 16;
                buffer_font_size = 16;

                theme = {
                  mode = "dark";
                  light = "One Light";
                  dark = "One Dark";
                };
              }
            '';
            description = ''
              Configuration written to Zed's {file}`settings.json`.
            '';
          };

          extensions = mkOption {
            type = types.listOf types.str;
            default = [ ];
            example = literalExpression ''
              [ "nix" "toml" "make" "python-snippets"]
            '';
            description = ''
              A list of the extensions Zed should install on startup.
              Use the name of a repository in the [extension list](https://github.com/zed-industries/extensions/tree/main/extensions).
            '';
          };

          userKeymaps = mkOption {
            type = jsonFormat.type;
            default = [ ];
            example = literalExpression ''
              [
                {
                  context = "Workspace";
                  bindings = {
                    ctrl-shift-t = "workspace::NewTerminal";
                    ctrl-k ctrl-o = "workspace::Open";
                    ctrl-o = "workspace::OpenFiles";
                  };
                  context = "Editor";
                  bindings = {
                    ctrl-: = "editor::ToggleComments";
                  };
                };
              ]
            '';
            description = ''
              Configuration written to Zed's {file}`keymap.json`.
            '';
          };
        };
      };
    })
  ];
}
