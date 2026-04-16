{
  description = "dotfiles managed with nix-darwin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{ nix-darwin, ... }:
    {
      darwinConfigurations.macos = nix-darwin.lib.darwinSystem {
        modules = [
          ./nix/darwin-configuration.nix
        ];
      };
    };
}
