{ pkgs, lib }:

lib.lists.flatten [
  [pkgs.neofetch]
  [pkgs.rpi-imager]
  [pkgs.vscode]
]
