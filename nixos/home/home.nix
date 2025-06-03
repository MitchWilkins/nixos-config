{ config, pkgs, lib, ... }:

{
  home.username = "rob";
  home.homeDirectory = "/home/rob";

  programs.home-manager.enable = true;

  # home.stateVersion = "23.05"; # Specify the version of Home Manager

  home.packages = with pkgs; [
    pkgs.vim
  ];
}
    
