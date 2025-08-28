{ config, pkgs, ... }:

{
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["amdgpu"];
  
  hardware.enableAllFirmware = true;

  # Last resort ChatGPT
  # boot.kernalParams = [ "nvidia-drm.modeset=1" ]; # DNE?
  # environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  # environment.sessionVariables.__GLX_VENDOR_LIBRARY_NAME = "nvidia";
  # environment.sessionVariables.GBM_BACKEND = "nvidia-drm";
  environment.sessionVariables.LIBVA_DRIVER_NAME = "radeonsi";

  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (action.id.indexOf("org.corectrl.helper") = 0 && subject.isInGroup("wheel")) {
        return polkit.Result.YES;
      }
    });
  '';
}
