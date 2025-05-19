{ pkgs, lib }:

lib.lists.flatten [
  [pkgs.neofetch]
  (import ./develop/packages.nix { inherit pkgs; })
  (import ./gaming/packages.nix { inherit pkgs; })
]
