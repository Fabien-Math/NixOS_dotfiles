{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Utils
    inkscape
    gimp
    zotero
    vlc
    qdirstat
    borgbackup
    # obsidian


    # docker-compose

    # Modeling
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
	  python313Packages.seaborn
    python313Packages.pyyaml
    # Python opengl
    python313Packages.pyopengl
	  python313Packages.pyglm
    python313Packages.glfw

    # pokego # Overlayed
  ];
}
