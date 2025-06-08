{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs._hyprland;
in {
  options.programs._hyprland = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable hyprland configuration";
    };
  };

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland.enable = true; 
    programs.waybar.enable                = true;
    
    home.sessionVariables.NIXOS_OZONE_WL = "1";

    xdg.configFile."hypr/hyprland.conf".source  = ./config/hyprland.conf;    
    xdg.configFile."waybar/config.jsonc".source = ./config/config.jsonc;
    xdg.configFile."waybar/style.css".source    = ./config/style.css;

    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "off";
        preload = [ "~/Pictures/Wallpapers/the_elder_scrolls_v_skyrim_by_artfall_d4w0bgn.jpg" ];
        wallpaper = [
          "DP-5,~/Pictures/Wallpapers/the_elder_scrolls_v_skyrim_by_artfall_d4w0bgn.jpg"
          "DP-4,~/Pictures/Wallpapers/the_elder_scrolls_v_skyrim_by_artfall_d4w0bgn.jpg"
        ];
      };
    };
  };
}