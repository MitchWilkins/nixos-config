{ pkgs, lib }:

lib.lists.flatten [
  (import ./de/system-packages.nix { inherit pkgs; })
  (import ./develop/system-packages.nix { inherit pkgs; })
]
