{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs._git;
in {
  options.programs._git = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable git configuration";
    };
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = "Mitch Wilkins";
      userEmail = "mitch.wilkins@me.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };

}
