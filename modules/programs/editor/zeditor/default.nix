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
            shell = {
              with_arguments = {
                program = "bash";
                args = [ "-i" ];
                title_override = null;
              };
            };

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

          collaboration_panel = {
            button = false;
          };

          tabs = {
	          activate_on_close = "history";
	          show_close_button = "hover";
	          close_position = "right";
	          file_icons = false;
	            git_status = true;
          };

          title_bar = {
            show_sign_in = false;
            show_user_picture = false;
            show_onboarding_banner = false;
            show_branch_icon = false;
            show_project_items = true;
            show_branch_name = true;
          };

          search = {
            button = false;
          };

          debugger = {
            button = false;
          };

          status_bar = {
            cursor_position_button = true;
            active_language_button = false;
          };

          project_panel = {
            sort_mode = "directories_first";
            hide_hidden = false;
            hide_root = true;
            indent_guides = {
              show = "never";
            };
            sticky_scroll = true;
            auto_fold_dirs = true;
            show_diagnostics = "errors";
          };

          diagnostics = {
            button = false;
            lsp_pull_diagnostics = {
              enabled = false;
            };
            inline = {
              enabled = false;
            };
            include_warnings = false;
          };

          scrollbar = {
            search_results = true;
            git_diff = true;
            cursors = true;
            diagnostics = "none";
          };

          tab_bar = {
            show_nav_history_buttons = false;
          };

          # direnv + flakes
          load_direnv = "shell_hook";
          base_keymap = "VSCode";

          vim_mode = false;
          show_whitespaces = "none";

          disable_ai = true;
          soft_wrap = "editor_width";
          relative_line_numbers = "enabled";
          hard_tabs = true;
          colorize_brackets = true;

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
              "ctrl-shift-q" = "zed::Quit";
              "alt-e" = "project_panel::ToggleFocus";
            };
          }

          {
            context = "Editor";
            bindings = {
              "ctrl-:" = "editor::ToggleComments";
            };
          }

          {
            context = "!ContextEditor > (Editor && mode == full)";
            bindings = {
              "alt-e" = "pane::RevealInProjectPanel";
            };
          }

          {
            context = "SettingsWindow";
            bindings = {
              "alt-e" = "settings_editor::ToggleFocusNav";
            };
          }

          {
            context = "(ProjectPanel && not_editing)";
            bindings = {
              "enter" = "project_panel::Open";
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
