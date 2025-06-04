{ config, pkgs, lib, ... }:

{
  imports = [
    ./modules/development
    ./modules/gaming
  ];

  home.username = "mitch";
  home.homeDirectory = "/home/mitch";

  programs.home-manager.enable = true;
  programs._development.enable = true;
  programs._gaming.enable      = true;

  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    vim
  ];
}
    
