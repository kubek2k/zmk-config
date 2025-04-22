{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell rec {
    buildInputs = with pkgs; [
        python311
        python311Packages.pip
    ];

    shellHook = ''
      python -m venv .venv
      source .venv/bin/activate
      pip install keymap_drawer
    '';
}
