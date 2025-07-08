{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs._gaming;
in {

  options.programs._gaming = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable development configuration";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      discord 
      lutris
      mangohud
      protonplus
    ];
  };
}
