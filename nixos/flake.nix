{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
       modules = [
         ./configuration.nix
         home-manager.nixosModules.home-manager
         {
           home-manager.useGlobalPkgs = true;
           home-manager.useUserPackages = true;
           home-manager.backupFileExtension = "backup"; # Set backup file extension
           home-manager.users.mitch = import ./home/home.nix {
             pkgs = import nixpkgs {
               system = "x86_64-linux";
             };
             lib = nixpkgs.lib;
             config = {};
           };
         }
       ];
      };
    };
  };
}
