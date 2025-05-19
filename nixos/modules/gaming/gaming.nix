{ config, pkgs, ... }:

{
  # Enable Steam support
  programs.steam.enable = true;

  # Optional: OpenGL 32-bit (for Steam/Proton)
  hardware.graphics.enable32Bit = true;
  hardware.graphics.enable = true;

  # Optional: Allow unfree packages (needed for Steam)
  nixpkgs.config.allowUnfree = true;
}
