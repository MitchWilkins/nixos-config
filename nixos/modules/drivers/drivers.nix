{ config, pkgs, ... }:

{
  imports =
    [
      # ./nvidia.nix # NVIDIA support.  
      ./amd.nix
    ];
}
