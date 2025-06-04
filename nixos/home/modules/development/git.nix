{ config, lib, pkgs, ... }:

{
  description = "Home Manager config for Mitch";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }: {
    homeConfigurations.mitch = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [];
      username = "Mitch Wilkins";
      useremail = "mitch.wilkins@me.com";
      homeDirectory = "/home/mitch";
    };
  };

  # programs.git.enable = true;
  # programs.git.userName = "Mitch Wilkins";
  # programs.git.userEmail = "mitch.wilkins@me.com";
}
