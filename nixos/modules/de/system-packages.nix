{ pkgs }: with pkgs; [
    kdePackages.bluedevil      # KDE Bluetooth integration
    bluez                      # Bluetooth protocol stack
    # gnome-tweaks

    # Hyprland
    libnotify
    mako      # Notification bar

    # Waybar for Hyprland
    # waybar
    # (waybar.overrideAttrs (oldAttrs : {
    #   mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    # }))
   
    # Rofi for Hyprland
    rofi-wayland

    # Wallpaper for Hyprland
    # hyprpaper

    # Network manager for Hyprland
    networkmanagerapplet

    #File Manager
    nemo
]
