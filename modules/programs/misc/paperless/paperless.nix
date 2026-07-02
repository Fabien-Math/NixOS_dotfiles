{ config, pkgs, ... }:

{
  services.paperless = {
    enable = true;

    # Address/port
    address = "0.0.0.0";
    port = 8000;

    # Administrator account
    passwordFile = "/var/lib/secrets/paperless-admin-password";

    # Data directories
    dataDir = "/srv/paperless";
    mediaDir = "/srv/paperless/media";
    consumptionDir = "/srv/paperless/consume";

    # OCR configuration
    settings = {
      PAPERLESS_OCR_LANGUAGE = "eng";
      PAPERLESS_OCR_LANGUAGES = "eng";
      PAPERLESS_TIME_ZONE = "UTC";

      # Optional
      PAPERLESS_URL = "http://biblio.com";
      PAPERLESS_FILENAME_FORMAT = "{created_year}/{correspondent}/{title}";
      PAPERLESS_CONSUMER_RECURSIVE = "true";
      PAPERLESS_TASK_WORKERS = "2";
      PAPERLESS_THREADS_PER_WORKER = "2";
    };
  };

  # Required services
  services.redis.servers.paperless = {
    enable = true;
  };

  services.postgresql = {
    enable = true;
    ensureDatabases = [ "paperless" ];
    ensureUsers = [
      {
        name = "paperless";
        ensureDBOwnership = true;
      }
    ];
  };

  # OCR packages
  environment.systemPackages = with pkgs; [
    tesseract
    tesseract4
    ghostscript
    unpaper
  ];

  networking.firewall.allowedTCPPorts = [ 8000 ];
}
