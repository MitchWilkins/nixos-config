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
        env = {
          TERM = "xterm-256color";
        };

        window = {
          opacity = 0.85;
          padding = {
            x = 5;
            y = 5;
          };
        };

        colors = {
          primary = {
            background = "#262626";
            foreground = "#f0f2fd";
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
