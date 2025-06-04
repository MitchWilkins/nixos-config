{ config, pkgs, lib, ... }:

{
  imports = [
    ./modules/development
  ];


  home.username = "mitch";
  home.homeDirectory = "/home/mitch";

  programs.home-manager.enable = true;
  programs.mod-alacritty.enable = true;  # Or false to disable

  home.stateVersion = "23.05"; # Specify the version of Home Manager

  home.packages = with pkgs; [
    vim
  ];
}
    
