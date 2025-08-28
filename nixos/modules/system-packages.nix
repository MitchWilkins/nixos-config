{ pkgs, lib, inputs }:

lib.lists.flatten [
  (import ./de/system-packages.nix { inherit pkgs; })
  (import ./drivers/system-packages.nix { inherit pkgs; })
  [ pkgs.lm_sensors ]
  [ pkgs.rose-pine-cursor ]
  [ inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default ]
]
