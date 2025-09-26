{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs._hyprland;
  wp = "${config.home.homeDirectory}/Pictures/Wallpapers/andre-benz-cXU6tNxhub0-unsplash.jpg";
in {
  options.programs._hyprland = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable hyprland configuration";
    };
  };

  config = mkIf cfg.enable {
    xdg.configFile."hypr/hyprland.conf".source  = ./config/hyprland.conf;    
    xdg.configFile."waybar/config.jsonc".source = ./config/config.jsonc;
    xdg.configFile."waybar/style.css".source    = ./config/style.css;


    wayland.windowManager.hyprland.enable = true; 
    programs.waybar.enable                = true;

    home.sessionVariables.NIXOS_OZONE_WL = "1";

    home.packages = with pkgs; [
      hyprcursor
      hypridle
      hyprlock
      hyprpaper
      hyprshot
      imv
      nemo
      yazi
    ];

    services.hyprpaper = {
      enable = true;

      settings = {
        preload = [ wp ];
        wallpaper = [
          "DP-3,${wp}"
          "DP-2,${wp}"
        ];
      };
    };

    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "hyprlock";
          before_sleep_cmd = "hyprlock";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };

        listeners = [
          {
            timeout = 300;
            on-timeout = "hyprlock";
          }
          {
            timeout = 600;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };

    services.mako = {
      enable = true;

      settings = {
        anchor = "top-right";
        border-radius = 10;
        default-timeout = 6000;
      };
    };
  };
}
