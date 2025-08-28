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
    
      bluetooth.enable = true;
  };

  # XDG Portal
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ 
    pkgs.xdg-desktop-portal-gtk 
    pkgs.xdg-desktop-portal-wlr 
  ];
  xdg.portal.config.common.default = "wlr";

  # services.displayManager.sddm.wayland.enable = true;
  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.theme = "elarun"; 
  # services.displayManager.sddm.settings.Theme.Current = "sugar-candy";
  # services.displayManager.sddm.settings.Theme.ThemeDir = "/etc/sddm/themes";
  services.blueman.enable = true; # Optional, but recommended for a system tray GUI 
  services.displayManager.ly.enable = true;
}
