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
      mangohud
      protonplus
    ];

    systemd.user.services.discord = {
      Unit = {
        Description = "Start Discord on login";
        After = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${pkgs.discord}/bin/discord";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}