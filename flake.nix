
{
  description = "Personal profile";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/23.11";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, ... }@inputs: inputs.utils.lib.eachSystem [
    "x86_64-linux"
  ] (system: let
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.default = pkgs.mkShell rec {
      name = "PersonalProfile";

      packages = with pkgs; [
        "vscode-langservers-extracted"
        "htmlq"
        "html-proofer"
        "html-tidy"
        "marksman"
      ];

    };

    packages.default = pkgs.callPackage ./default.nix {};
  });
}
