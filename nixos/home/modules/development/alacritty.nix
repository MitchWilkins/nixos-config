{ config, lib, pkgs, ... }:

let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
in
{
 imports =
    [
      (import "${home-manager}/nixos")
    ];
  home-manager.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FireCode Nerd Font" ]; })
 ];
 
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        opacity = 0.9;
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
    };
  };
}
