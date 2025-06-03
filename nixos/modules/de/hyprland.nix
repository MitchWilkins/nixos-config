{ config, pkgs, ... }: 

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

 
  # If your cursor becomes invisible
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  # Hint electron apps to use wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  hardware = {
      # Opengl
      graphics.enable = true;

      # Most wayland compositors need this
      nvidia.modesetting.enable = true;
  };

  # XDG Portal
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
