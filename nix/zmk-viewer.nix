{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {
  name = "zmk-viewer";
  version = "2.0.0";
  src = pkgs.fetchzip {
    url = "https://github.com/MrMarble/${pname}/releases/download/v${version}/${pname}-${version}-darwin-arm64.tar.gz";
    sha256 = "0ldh303r5063kd5y73hhkbd9v11c98aki8wjizmchzx2blwlipy7";
  };
  phases = ["installPhase" "patchPhase"];
  installPhase = ''
    mkdir -p $out/bin
    cp $src/${pname}-${version}-darwin-arm64 $out/bin/zmk-viewer
    chmod +x $out/bin/zmk-viewer
  '';
}
