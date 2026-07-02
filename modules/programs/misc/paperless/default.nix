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
}
