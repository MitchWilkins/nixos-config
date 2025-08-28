{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs._development;
in {
  imports = [
    ./alacritty.nix
    ./git.nix
    ./nvim
  ];

  options.programs._development = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable development configuration";
    };
  };

  config = mkIf cfg.enable {
    programs._alacritty.enable = true;
    programs._git.enable = true;
    programs._nvim.enable = true;

    programs.vscode.enable = true;

    home.packages = with pkgs; [
      azure-cli
      fzf
      insomnia
      mongosh
      terraform
    ];
  };


}
