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

  hardware.amdgpu.opencl.enable = true;

  environment.sessionVariables.LIBVA_DRIVER_NAME = "radeonsi";

  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (action.id.indexOf("org.corectrl.helper") = 0 && subject.isInGroup("wheel")) {
        return polkit.Result.YES;
      }
    });
  '';
}
