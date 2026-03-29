{
  description = "Neovim Setup Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          name = "nvim-setup";

          buildInputs = with pkgs; [
            gcc
            lua51Packages.lua
            lua51Packages.luarocks
          ];
        };
      });
}

