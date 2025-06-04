{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs._alacritty;
in {
  options.programs._alacritty = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable custom Alacritty configuration";
    };
  };

  config = mkIf cfg.enable {
    programs.alacritty = {
      enable = true;

      settings = {
        window = {
          opacity = 0.6;
          padding = {
            x = 10;
            y = 10;
          };
        };

        font = {
          normal = {
            family = "FiraCode Nerd Font";
            style = "Regular";
          };
          size = 11.5;
        };

        mouse = {
          bindings = [
            {
              mouse = "Right";
              action = "Paste";
            }
          ];
        };
      };
    };
  };
}
