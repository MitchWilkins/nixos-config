{ pkgs, lib }:

lib.lists.flatten [
  [pkgs.neofetch]
  [pkgs.rpi-imager]
  (import ./develop/packages.nix { inherit pkgs; })
  (import ./gaming/packages.nix { inherit pkgs; })
]
