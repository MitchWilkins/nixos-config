{ pkgs, lib, inputs }:

lib.lists.flatten [
  (import ./de/system-packages.nix { inherit pkgs; })
  [ pkgs.lm_sensors ]
  [ inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default ]
]
