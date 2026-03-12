{ host, pkgs, lib, ... }:
let
  inherit (import ../../hosts/${host}/variables.nix) username;
in
{
	# Dangerous, docker have root access on the laptop
  users.users.${username}.extraGroups = [ "docker" ];

  # Only enable either docker or podman -- Not both
  virtualisation = {
    spiceUSBRedirection.enable = true;

    docker = {
      enable = true;
      daemon = {
        settings = {
        	data-root = "/home/fabien/softwares/docker";
        };
      };
    };

    podman.enable = false;
  };
}
