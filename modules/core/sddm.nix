
{ inputs, pkgs, ... }:

let
  clockworkTheme = pkgs.stdenvNoCC.mkDerivation {
    pname = "clockwork";
    version = "1.0";

    src = inputs.qylock;
    dontBuild = true;

    installPhase = ''
      mkdir -p $out/share/sddm/themes/clockwork
      cp -r themes/clockwork/. $out/share/sddm/themes/clockwork/
    '';
  };
in
{
  environment.systemPackages = [
    clockworkTheme
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    theme = "clockwork/orbital";

    extraPackages = with pkgs; [
      qt6.qt5compat
      qt6.qtsvg
    ];
  };
}
