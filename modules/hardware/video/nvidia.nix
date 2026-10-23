{ host, lib, pkgs, config, ... }:
let
  inherit (import ../../../hosts/${host}/variables.nix)
    nvidiaChannel;
in
{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = true;

    package =
      config.boot.kernelPackages.nvidiaPackages.${nvidiaChannel};

    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    nvidiaSettings = false;

    prime = {
      # Replace with the actual IDs from lspci
      amdgpuBusId = "PCI:6:0:0";
      nvidiaBusId = "PCI:1:0:0";

      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };

  boot.kernelParams = [
    "nvidia-drm.modeset=1"
    "nvidia_drm.fbdev=1"
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      nvidia-vaapi-driver
    ];
  };

  nixpkgs.config = {
    nvidia.acceptLicense = true;
    allowUnfree = true;
  };

  environment.sessionVariables =
    lib.optionalAttrs config.programs.hyprland.enable {
      WLR_NO_HARDWARE_CURSORS = "1";
    };
}
