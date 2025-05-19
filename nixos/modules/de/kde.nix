{ config, pkgs, ... }:

{
  # KDE
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true; # Optional, but recommended for a system tray GUI 
}
