{ config, lib, pkgs, ... }:

let
  inherit (lib) mkOption mkIf types mkEnableOption;
  cfg = config.custom._develop;
in {
  imports = [
    ./docker.nix
  ];

  options.custom._develop = {
    enable = mkEnableOption "Enable development system configuration";
  };

  config = mkIf cfg.enable {
    fonts.packages = with pkgs; [
      nerd-fonts.fira-code
    ];

    services._docker.enable = true;
  };
}

