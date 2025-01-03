{
  description = "My Nixos config";

  #nixConfig = {
  #  extra-substituters = [
  #
  #  ];
  #  extra-trusted-public-keys = [
  #
  #  ];
  #};

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #nixvim-config.url = "github:Fuurin08/nixvim";
    nixvim.url = "github:dc-tec/nixvim";
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # ags.url = "github:Aylur/ags";
    niri.url = "github:sodiboo/niri-flake";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      auto-cpufreq,
      # hyprland,
      #nixvim-config,
      nixvim,
      anyrun,
      niri,
      ...
    }:
    {
      nixosConfigurations = {
        snow =
          let
            username = "fuurin";
            specialArgs = { inherit username; };
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            system = "x86_64-linux";

            modules = [
              niri.nixosModules.niri
              (
                { pkgs, ... }:
                {
                  programs.niri.enable = true;
                  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
                  programs.niri.package = pkgs.niri-unstable;
                }
              )
              auto-cpufreq.nixosModules.default

              ./hosts/snow

              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  #backupFileExtension = "home-manager.backup";
                  extraSpecialArgs = inputs // specialArgs;
                  users.${username} = import ./home/users/${username}.nix;
                };
              }
            ];
          };
      };
    };
}
