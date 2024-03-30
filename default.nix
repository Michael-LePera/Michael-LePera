{ lib
, llvmPackages_11
, pkgs
, cmake }:

pkgs.stdenv.mkDerivation rec {
  pname = "Web";
  version = "0.0.1";
  
  src = ./.;

  nativeBuildInputs = [];
  buildInputs = [];

  buildPhase = ''
  '';

  installPhase = ''
  '';
}
