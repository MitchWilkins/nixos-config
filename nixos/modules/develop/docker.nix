{ config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.services._docker;
in {
  options.services._docker = {
    enable = mkEnableOption "Enable Docker system configuration";
  };

  config = mkIf cfg.enable {
    virtualisation.docker.enable = true;

    users.users."mitch" = {
      extraGroups = [ "docker" ];
    };

    environment.systemPackages = with pkgs; [
      docker
    ];
  };
}
