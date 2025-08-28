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
          opacity = 0.50;
          blur = true;
          padding = {
            x = 5;
            y = 5;
          };
        };

        colors = {
          primary = {
            background = "#1a1b26";
            foreground = "#c0caf5";
          };
          normal = {
            black   = "#15161E";
            red     = "#f7768e";
            green   = "#9ece6a";
            yellow  = "#e0af68";
            blue    = "#7aa2f7";
            magenta = "#bb9af7";
            cyan    = "#7dcfff";
            white   = "#a9b1d6";
          };
          bright = {
            black   = "#414868";
            red     = "#f7768e";
            green   = "#9ece6a";
            yellow  = "#e0af68";
            blue    = "#7aa2f7";
            magenta = "#bb9af7";
            cyan    = "#7dcfff";
            white   = "#c0caf5";
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
