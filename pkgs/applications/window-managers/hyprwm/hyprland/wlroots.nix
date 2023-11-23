{ fetchFromGitLab
, hyprland
, wlroots
, lib
, enableNvidiaPatches ? false
}:

wlroots.overrideAttrs
  (old: {
    version = "0.17.0-dev";

    src = fetchFromGitLab {
      domain = "gitlab.freedesktop.org";
      owner = "wlroots";
      repo = "wlroots";
      rev = "5de9e1a99d6642c2d09d589aa37ff0a8945dcee1";
      hash = "sha256-HXu98PyBMKEWLqiTb8viuLDznud/SdkdJsx5A5CWx7I=";
    };

    pname =
      old.pname
      + "-hyprland"
      + lib.optionalString enableNvidiaPatches "-nvidia";

    patches = lib.optionals enableNvidiaPatches [
      "${hyprland.src}/nix/patches/wlroots-nvidia.patch"
    ];

    postPatch = lib.optionalString enableNvidiaPatches ''
      substituteInPlace render/gles2/renderer.c --replace "glFlush();" "glFinish();"
    '';
  })
