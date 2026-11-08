{ pkgs, inputs, ... }:
let
  # Reference unstable pkgs from your flake inputs
  unstable = inputs.nixpkgs.legacyPackages.x86_64-linux;
in
{
  environment.systemPackages = with pkgs; [
    #####   Utils   #####
    # Vectorial drawing
    inkscape
    # General Image Manipulation Program
    gimp
    # Simple open source video editor
    # shotcut
    # Image viewer
    qimgv
    # Bibliography tool
    zotero
    # Open source office suite like
    onlyoffice-desktopeditors
    # Media player
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
    # A set of tool for PostScript and PDF (like compression)
    ghostscript
    # Note system
    unstable.affine
    # Utility to count line of code of a project
    cloc
    # File trasfert
    localsend

    #####   Modeling   #####
    blender
    # (blender.override {
    #   config.cudaSupport = true;
    #   config.rocmSupport = false;
    # })
    orca-slicer

    freecad
    calculix-ccx

    #####   Code   #####
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
