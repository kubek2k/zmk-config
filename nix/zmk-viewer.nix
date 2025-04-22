{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation rec {
  name = "zmk-viewer";
  version = "2.0.0";
  src = pkgs.fetchzip {
    url = "https://github.com/MrMarble/${name}/releases/download/v${version}/${name}-${version}-darwin-arm64.tar.gz";
    sha256 = "J6OqWaqT2iHsAvUKxTgUOqgQr1CBLS5j6ld5ncviUNI=";
  };
  phases = ["installPhase" "patchPhase"];
  installPhase = ''
    mkdir -p $out/bin
    ls -alr $src
    cp $src/${name}-v${version}-darwin-arm64 $out/bin/zmk-viewer
    chmod +x $out/bin/zmk-viewer
  '';
}
