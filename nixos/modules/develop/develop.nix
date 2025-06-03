{ config, options, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

   virtualisation.docker.enable = true;
   users.users.mitch.extraGroups = [ "docker" ];   

#  programs.alacritty = {
#    enable = true;
#    # You can add your custom config here:
#    settings = {
#      font = {
#        normal = {
#          family = "FiraCode Nerd Font";
#          style = "Regular";
#        };
#      };
#      # Add more config options here...
#    };
#  };
}
