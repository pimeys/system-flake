{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.09";
    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, agenix }: {
    nixosConfigurations.muspus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules =
        [
          ./hosts/muspus.nix
          agenix.nixosModules.age
        ];
    };
  };
}
