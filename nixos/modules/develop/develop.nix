{ config, options, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerdfonts
    # or specific fonts like:
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

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
