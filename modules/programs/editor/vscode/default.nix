{
  lib,
  pkgs,
  ...
}:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "vscode" ];
  home-manager.sharedModules = [
    (_: {
      programs.vscode = {
        enable = true;
        mutableExtensionsDir = true;
        # package = pkgs.vscodium;
        package = pkgs.vscode;
        profiles.default = {
          extensions = with pkgs.vscode-extensions; [
            # Themes
            catppuccin.catppuccin-vsc
            catppuccin.catppuccin-vsc-icons

            # Utils
            hediet.vscode-drawio
            yzhang.markdown-all-in-one

            # Latex
            james-yu.latex-workshop

            # Python
            ms-python.python
            ms-python.vscode-pylance
            ms-python.debugpy

            # C / C++
            ms-vscode.cpptools

            # Docker
            ms-vscode-remote.remote-containers

            # Nix
            bbenoist.nix
            jnoortheen.nix-ide
            arrterian.nix-env-selector

            # Git
            mhutchie.git-graph
            eamodio.gitlens
          ];
          keybindings = [
	          {
	            key = "ctrl+shift+[Period]";
	            command = "-editor.action.commentLine";
	            when = "editorTextFocus && !editorReadonly";
	          }
	          {
	            key = "ctrl+[Period]";
	            command = "-breadcrumbs.focus";
	            when = "breadcrumbsPossible && breadcrumbsVisible";
	          }
            {
              key = "ctrl+[Period]";
              command = "editor.action.commentLine";
              when = "editorTextFocus && !editorReadonly";
            }
            {
              key = "ctrl+s";
              command = "workbench.action.files.saveFiles";
            }
            {
              key = "ctrl+q";
              command = "-workbench.action.quit";
            }
		        {
		          key = "ctrl+shift+q";
		          command = "workbench.action.quit";
		        }
					  {
							key = "shift+alt+m";
							command = "editor.action.toggleMinimap";
					  }
          ];
          userSettings = {
            "chat.disableAIFeatures" = true;

            "update.mode" = "none";
            # "extensions.autoUpdate" = false; # Fixes vscode freaking out when theres an update
            "window.titleBarStyle" = "custom"; # needed otherwise vscode crashes, see https://github.com/NixOS/nixpkgs/issues/246509
            "window.menuBarVisibility" = "classic";
            "window.zoomLevel" = 0.5;
            "editor.fontSize" = 14;
            "workbench.colorTheme" = "Catppuccin Macchiato";
            # "workbench.colorTheme" = "Quiet Light";
            # "workbench.iconTheme" = "catppuccin-mocha"; # Comment to reset to vscode default
            "catppuccin.accentColor" = "lavender";
            "vsicons.dontShowNewVersionMessage" = true;
            "explorer.confirmDragAndDrop" = false;
            "editor.fontLigatures" = true;
            "workbench.startupEditor" = "none";
            "telemetry.enableCrashReporter" = false;
            "telemetry.enableTelemetry" = false;



            "security.workspace.trust.untrustedFiles" = "open";

            "git.enableSmartCommit" = true;
            "git.autofetch" = true;
            "git.confirmSync" = false;
            "gitlens.hovers.annotations.changes" = false;
            "gitlens.hovers.avatars" = false;

            "editor.semanticHighlighting.enabled" = true;
            "gopls" = {
              "ui.semanticTokens" = true;
            };

            "editor.codeActionsOnSave" = {
              "source.organizeImports" = "explicit";
            };
            "editor.inlineSuggest.enabled" = true;
            "editor.formatOnSave" = true;
            # "editor.formatOnType" = true;
            "editor.formatOnPaste" = true;

            "editor.minimap.enabled" = true;
            "workbench.sideBar.location" = "left";
            "workbench.tree.indent" = 20;

            # "workbench.activityBar.location" = "hidden";
            # "workbench.editor.showTabs" = "single";
            # "workbench.statusBar.visible" = false;
            "workbench.layoutControl.type" = "menu";
            "workbench.editor.limit.enabled" = true;
            "workbench.editor.limit.value" = 10;
            "workbench.editor.limit.perEditorGroup" = true;
            "explorer.openEditors.visible" = 0;
            "breadcrumbs.enabled" = true;
            "editor.renderControlCharacters" = false;
            "editor.stickyScroll.enabled" = true; # Top code preview
            "editor.scrollbar.verticalScrollbarSize" = 10;
            "editor.scrollbar.horizontalScrollbarSize" = 10;
            "editor.scrollbar.vertical" = "visible";
            "editor.scrollbar.horizontal" = "visible";
            "workbench.layoutControl.enabled" = true;

            "editor.mouseWheelZoom" = true;

            "C_Cpp.autocompleteAddParentheses" = true;
            "C_Cpp.formatting" = "vcFormat";
            "C_Cpp.vcFormat.newLine.closeBraceSameLine.emptyFunction" = true;
            "C_Cpp.vcFormat.newLine.closeBraceSameLine.emptyType" = true;
            "C_Cpp.vcFormat.space.beforeEmptySquareBrackets" = true;
            "C_Cpp.vcFormat.newLine.beforeOpenBrace.block" = "sameLine";
            "C_Cpp.vcFormat.newLine.beforeOpenBrace.function" = "sameLine";
            "C_Cpp.vcFormat.newLine.beforeElse" = false;
            "C_Cpp.vcFormat.newLine.beforeCatch" = false;
            "C_Cpp.vcFormat.newLine.beforeOpenBrace.type" = "sameLine";
            "C_Cpp.vcFormat.space.betweenEmptyBraces" = true;
            "C_Cpp.vcFormat.space.betweenEmptyLambdaBrackets" = true;
            "C_Cpp.vcFormat.indent.caseLabels" = true;
            "C_Cpp.intelliSenseCacheSize" = 2048;
            "C_Cpp.intelliSenseMemoryLimit" = 2048;
            "C_Cpp.default.browse.path" = [
              ''''${workspaceFolder}/**''
            ];
            "C_Cpp.default.cStandard" = "gnu11";
            "C_Cpp.inlayHints.parameterNames.hideLeadingUnderscores" = false;
            "C_Cpp.intelliSenseUpdateDelay" = 500;
            "C_Cpp.workspaceParsingPriority" = "medium";
            "C_Cpp.clang_format_sortIncludes" = true;
            "C_Cpp.doxygen.generatedStyle" = "/**";

            # Latex
            "latex-workshop.latex.autoBuild.run" = "never";
            "latex-workshop.formatting.latex" = "latexindent";
            "latex-workshop.format.fixMath.enabled" = true;

          };
        };
      };
    })
  ];
}
