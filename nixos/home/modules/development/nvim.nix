{ config, lib, pkgs, ... }: 

with lib;

let
  cfg = config.programs._nvim;
in {
  options.programs._nvim = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable custom Lazy/NeoVim configuration";
    };
  };

  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      neovim
      curl
      tmux
      ripgrep
      fd
      unzip
      wget
      gcc           # for treesitter compilation
      nodejs        # for language servers
      python3
      stylua        # optional: Lua formatter
      lua-language-server
    ];
    
    # programs.neovim = {
    #   enable = true;
    #   defaultEditor = true;
    #   viAlias = true;
    #   vimAlias = true;
    #   vimdiffAlias = true;
    #   # plugins = with pkgs.vimPlugins; [
    #   #   nvim-lspconfig
    #   #   nvim-treesitter.withAllGrammars
    #   # ];
    # };
  };
}

