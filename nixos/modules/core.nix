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

  # NVIDIA workaround
  boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  # Cancel suspend
  systemd.sleep.extraConfig = ''
    HandleSuspendKey=ignore
    HandleHibernateKey=ignore

    AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';

}
