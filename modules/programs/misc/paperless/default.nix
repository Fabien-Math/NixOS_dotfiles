{ pkgs, ... }:
{
  services.paperless = {
    enable = true;

    address = "127.0.0.1";

    passwordFile = "/run/secrets/paperless-password";

    mediaDir = "/srv/paperless/media";
    consumptionDir = "/srv/paperless/consume";

    settings = {
      PAPERLESS_OCR_LANGUAGE = "eng";
      PAPERLESS_TIME_ZONE = "Europe/Paris";
    };
  };

  home-manager.sharedModules = [
    (_: {
      xdg.desktopEntries = {
        "paperless" = {
          name = "Paperless";
          genericName = "File Manager";
          comment = "Launch Paperless in kiosk mode";
          exec = "firefox -P Paperless --kiosk http://localhost:28981";
          icon = "./paperless-ngx.png";
          mimeType = [
            "Application"
          ];
          categories = [
            "Application"
          ];
          terminal = false; # Important: set to false since we're calling kitty directly
        };
      };
    })
  ];

}
