{ pkgs, lib }:

lib.lists.flatten [
  (import ./de/system-packages.nix { inherit pkgs; })
  [ pkgs.lm_sensors ]
]
