{ inputs, system, config, pkgs, lib, ... }:

{
  imports = [
    ./modules/development
    ./modules/gaming
    ./modules/desktop-environment
  ];

  home.username = "mitch";
  home.homeDirectory = "/home/mitch";
  home.sessionVariables = {
    XCURSOR_THEME = "rose-pine-cursors";
  };

  programs.home-manager.enable         = true;
  programs._desktop-environment.enable = true;
  programs._development.enable         = true;
  programs._gaming.enable              = true;

  programs.joplin-desktop.enable = true;
  programs.btop.enable = true;
  programs.htop.enable = true;

  home.packages = with pkgs; [
    darktable
    qalculate-gtk
    rawtherapee

    inputs.zen-browser.packages."${system}".default
  ];

  home.stateVersion = "23.05";
}
    
