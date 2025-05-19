{ config, pkgs, ... }:

{
  # Enable proprietary NVIDIA drivers.
  services.xserver.videoDrivers = [ "nvidia" ];  

  # Required for NVIDIA 560+
  hardware.nvidia = {
    modesetting.enable = true;  # Enable modesetting for Wayland support (needed even if you're on X11)
    open = false;               # use proprietary driver (most stable)
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
