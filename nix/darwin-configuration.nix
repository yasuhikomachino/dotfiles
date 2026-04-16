{ ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin";

  imports = [
    ./modules/finder.nix
  ];

  system.stateVersion = 6;
}
