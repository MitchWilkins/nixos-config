{ config, pkgs, ... }:

{
  imports = 
    [
      ./de/de.nix            # Development Environment.
      ./develop              # Development.
      ./drivers/drivers.nix  # Drivers.
      ./gaming/gaming.nix    # Gaming.
    ];

  services.flatpak.enable = true;

  # NVIDIA workaround
  boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  # ZFS
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot  = false;
  boot.zfs.extraPools = [ "photos" ];
  networking.hostId         = "450d961a";
  services.zfs.autoScrub.enable = true;
  
  # Samba
  services.samba = {
    enable = true;
    openFirewall = true;  # Opens ports 137-139 and 445
    shares = {
      photos = {
        path = "/photos";
        browseable = true;
        writable = true;
        "create mask" = "0664";
        "directory mask" = "2775";
      };
    };
  };

  # Cancel suspend
  # systemd.sleep.extraConfig = ''
  #   HandleSuspendKey=ignore
  #   HandleHibernateKey=ignore
  #
  #   AllowSuspend=no
  #   AllowHibernation=no
  #   AllowHybridSleep=no
  #   AllowSuspendThenHibernate=no
  # '';

  custom._develop.enable = true;
  programs.gamemode.enable = true; # enable for gaming

  networking.networkmanager.enable = true;
  networking.networkmanager.insertNameservers = [ "1.1.1.1" "1.0.0.1" "9.9.9.9" "149.112.112.112" ];

}
