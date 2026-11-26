
{
  description = "NixOS with CachyOS Kernel";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
  };

  outputs = inputs@{
    self,
    nixpkgs,
    home-manager,
    nix-cachyos-kernel,
    ...
  }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };

      modules = [
        # CachyOS Kernel
        ({ pkgs, ... }: {
          nixpkgs.overlays = [
            nix-cachyos-kernel.overlays.pinned
          ];

          boot.kernelPackages =
            pkgs.cachyosKernels.linuxPackages-cachyos-latest;
        })

        ./configuration.nix

        # Home Manager
        home-manager.nixosModules.home-manager

        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {
              inherit inputs;
            };

            users.duc = ./home.nix;
          };
        }
      ];
    };
  };
}
