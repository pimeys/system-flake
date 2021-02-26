{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.09";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-doom-emacs.url = "github:vlaci/nix-doom-emacs";
  };

  outputs = {
    self
    , nixpkgs
    , agenix
    , home-manager
    , nix-doom-emacs
  }: {
    nixosConfigurations.muspus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules =
        [
          ./hosts/muspus.nix
          agenix.nixosModules.age
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.pimeys = import ./home.nix;
          }
        ];
    };
  };
}
