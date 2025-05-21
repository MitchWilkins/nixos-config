{ config, pkgs, ... }:

{
  imports = 
    [
      ./de/de.nix            # Development Environment.
      ./develop/develop.nix  # Development.
      ./drivers/drivers.nix  # Drivers.
      ./gaming/gaming.nix    # Gaming.
    ];

  services.flatpak.enable = true;
}
