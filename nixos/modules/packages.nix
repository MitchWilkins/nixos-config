{ pkgs, lib }:

lib.lists.flatten [
  [pkgs.neofetch]
  [pkgs.rpi-imager]
  [pkgs.vscode]
  [pkgs.tor-browser-bundle-bin]
]
