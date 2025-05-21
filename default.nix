{ pkgs ? import (fetchTarball channel:nixos-24.11) {} }:

with pkgs;
stdenv.mkDerivation {
  pname = "rust-perfcnt";
  version = "0.7.3-mod";
  src = lib.fileset.toSource {
    root = ./.;
    fileset = lib.fileset.gitTracked ./.;
  };

  buildInputs = [
    rustc
    rust-analyzer
    cargo
  ];

  shellHook=
    ''
      export LOCALE_ARCHIVE="${pkgs.glibcLocales}/lib/locale/locale-archive";
    '';
}
