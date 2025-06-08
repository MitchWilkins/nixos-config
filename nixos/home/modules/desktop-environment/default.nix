{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs._desktop-environment;
in {
  imports = [
    ./hyprland.nix
    # ./waybar.nix
  ];

  options.programs._desktop-environment = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable desktop environment configuration";
    };
  };

  config = mkIf cfg.enable {
    programs._hyprland.enable = true;
  };
}