
{
  description = "Personal profile";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/22.11";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, ... }@inputs: inputs.utils.lib.eachSystem [
    "x86_64-linux" "i686-linux" "aarch64-linux" "x86_64-darwin"
  ] (system: let
    pkgs = import nixpkgs {
      inherit system;
      overlays = [];
      # config.allowUnfree = true;
    };
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
