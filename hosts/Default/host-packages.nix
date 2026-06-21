{ pkgs, inputs, ... }:
let
  # Reference unstable pkgs from your flake inputs
  unstable = inputs.nixpkgs.legacyPackages.x86_64-linux;
in
{
  environment.systemPackages = with pkgs; [
    #####   Utils   #####
    inkscape
    gimp
    qimgv
    zotero
    onlyoffice-desktopeditors
    vlc
    # Better file diff
    meld
    # Basic terminal calculator
    bc
    # Disk space analyser
    qdirstat
    # Backup tool
    borgbackup
    # Color generation and manipulator
    pastel
    # Ensure bash is interactive
    bashInteractive
    # A set of tool for PostScript and PDF (like compression)
    ghostscript
    # Utility for bidirectional data transfer between two independent data channels (Check Hyprland monitors changes)
    socat
    # Note system
    unstable.affine
    # Utility to count line of code of a project
    cloc
    # File trasfert
    localsend

    #####   Modeling   #####
    blender
    bambu-studio

    freecad
    calculix-ccx

    # Code
    # Latex
    texliveFull
    # C
    glib
    clang-tools
    # Compression tool
    zlib
    # Simple interprocess messaging system
    dbus
    # Python
    (python313.withPackages (ps: with ps; [
      numpy
      scipy
      matplotlib
      tqdm
      pyyaml
      numpydoc
    ]))
  ];
}
