{ config, options, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

   virtualisation.docker.enable = true;
   users.users.mitch.extraGroups = [ "docker" ];
}
