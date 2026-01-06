{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    #####   Utils   #####
    inkscape
    gimp
    zotero
    onlyoffice-desktopeditors
    vlc
    # Better file diff
    meld
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

    #####   Modeling   #####
    blender
    freecad

    calculix-ccx
    bambu-studio

    # Code
    # Latex
    texliveFull
    # C
    glib
    # OpenGL related
    mesa
    libGL
    glfw
    freetype
    fontconfig
    xorg.libX11
    libxkbcommon
    # Compression tool
    zlib
    # Simple interprocess messaging system
    dbus
    # Python
    python313
    python313Packages.numpydoc
    python313Packages.numpy
    python313Packages.matplotlib
    python313Packages.tqdm
	  python313Packages.scipy
    python313Packages.pyyaml

  ];
}
