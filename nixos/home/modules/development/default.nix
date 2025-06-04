{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs._development;
in {
  options.programs._development = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable development configuration";
    };
  };

  config = mkIf cfg.enable {
    imports = [
      ./alacritty.nix
      ./git.nix
    ];
  };


}