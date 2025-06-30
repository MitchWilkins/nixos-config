{ config, pkgs, lib, ... }:

{
  imports = [
    ./modules/development
    ./modules/gaming
    ./modules/desktop-environment
  ];

  home.username = "mitch";
  home.homeDirectory = "/home/mitch";

  programs.home-manager.enable         = true;
  programs._desktop-environment.enable = true;
  programs._development.enable         = true;
  programs._gaming.enable              = true;

  programs.joplin-desktop.enable = true;
  programs.htop.enable = true;
  home.stateVersion = "23.05";
}
    
