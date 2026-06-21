{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  home-manager.sharedModules = [
    (_: {
      programs.firefox = {
        enable = true;
        policies = import ./policies.nix { inherit lib; };
        languagePacks = [
          "en-GB"
          "en-US"
        ];
        profiles = {
          profile_0 = {
            # choose a profile name; directory is /home/<user>/.mozilla/firefox/profile_0
            id = 0; # 0 is the default profile; see also option "isDefault"
            name = "Work"; # name as listed in about:profiles
            isDefault = true; # can be omitted; true if profile ID is 0
            settings = import ./settings.nix;
            bookmarks = import ./bookmarks.nix;
            search = import ./search.nix { inherit pkgs; };
            extraConfig = ''
              ${builtins.readFile "${inputs.betterfox}/Fastfox.js"}
              ${builtins.readFile "${inputs.betterfox}/Peskyfox.js"}
              ${builtins.readFile "${inputs.betterfox}/Securefox.js"}
              ${builtins.readFile "${inputs.betterfox}/Smoothfox.js"}
              user_pref("extensions.activeThemeID", "{8446b178-c865-4f5c-8ccc-1d7887811ae3}");
              user_pref("extensions.formautofill.addresses.enabled", false);
              user_pref("extensions.formautofill.creditCards.enabled", false);
              user_pref("dom.security.https_only_mode_pbm", true);
              user_pref("dom.security.https_only_mode_error_page_user_suggestions", true);
              user_pref("browser.firefox-view.feature-tour", "{\"screen\":\"\",\"complete\":true}");
              user_pref("identity.fxaccounts.enabled", false);
              user_pref("browser.tabs.firefox-view-next", false);
              user_pref("privacy.sanitize.sanitizeOnShutdown", false);
              user_pref("privacy.clearOnShutdown.cache", true);
              user_pref("privacy.clearOnShutdown.cookies", false);
              user_pref("privacy.clearOnShutdown.offlineApps", false);
              user_pref("browser.sessionstore.privacy_level", 0);
              user_pref("floorp.browser.sidebar.enable", false);
              user_pref("geo.enabled", false);
              user_pref("media.navigator.enabled", false);
              user_pref("dom.event.clipboardevents.enabled", false);
              user_pref("dom.event.contextmenu.enabled", false);
              user_pref("dom.battery.enabled", false);
              user_pref("extensions.enabledScopes", 15);
              user_pref("extensions.autoDisableScopes", 0);
              user_pref("browser.newtabpage.activity-stream.floorp.newtab.imagecredit.hide", true);
              user_pref("browser.newtabpage.activity-stream.floorp.newtab.releasenote.hide", true);
              user_pref("browser.search.separatePrivateDefault", true);
            '';
          };
          profile_1 = {
            # choose a profile name; directory is /home/<user>/.mozilla/firefox/profile_0
            id = 1; # 0 is the default profile; see also option "isDefault"
            name = "Home"; # name as listed in about:profiles
            isDefault = false; # can be omitted; true if profile ID is 0
            settings = import ./settings.nix;
            bookmarks = import ./bookmarks.nix;
            search = import ./search.nix { inherit pkgs; };
            extraConfig = ''
              ${builtins.readFile "${inputs.betterfox}/Fastfox.js"}
              ${builtins.readFile "${inputs.betterfox}/Peskyfox.js"}
              ${builtins.readFile "${inputs.betterfox}/Securefox.js"}
              ${builtins.readFile "${inputs.betterfox}/Smoothfox.js"}
              user_pref("extensions.activeThemeID", "{8446b178-c865-4f5c-8ccc-1d7887811ae3}");
              user_pref("extensions.formautofill.addresses.enabled", false);
              user_pref("extensions.formautofill.creditCards.enabled", false);
              user_pref("dom.security.https_only_mode_pbm", true);
              user_pref("dom.security.https_only_mode_error_page_user_suggestions", true);
              user_pref("browser.firefox-view.feature-tour", "{\"screen\":\"\",\"complete\":true}");
              user_pref("identity.fxaccounts.enabled", false);
              user_pref("browser.tabs.firefox-view-next", false);
              user_pref("privacy.sanitize.sanitizeOnShutdown", false);
              user_pref("privacy.clearOnShutdown.cache", true);
              user_pref("privacy.clearOnShutdown.cookies", false);
              user_pref("privacy.clearOnShutdown.offlineApps", false);
              user_pref("browser.sessionstore.privacy_level", 0);
              user_pref("floorp.browser.sidebar.enable", false);
              user_pref("geo.enabled", false);
              user_pref("media.navigator.enabled", false);
              user_pref("dom.event.clipboardevents.enabled", false);
              user_pref("dom.event.contextmenu.enabled", false);
              user_pref("dom.battery.enabled", false);
              user_pref("extensions.enabledScopes", 15);
              user_pref("extensions.autoDisableScopes", 0);
              user_pref("browser.newtabpage.activity-stream.floorp.newtab.imagecredit.hide", true);
              user_pref("browser.newtabpage.activity-stream.floorp.newtab.releasenote.hide", true);
              user_pref("browser.search.separatePrivateDefault", true);
            '';
          };
        };
      };
    })
  ];
}
