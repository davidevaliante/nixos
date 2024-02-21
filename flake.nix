{
  description = "A starting point configuration for Davide NixOS repository";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    helix.url = "github:helix-editor/helix/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      hydrogen = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	specialArgs = { inherit inputs; };
	modules = [
          ./hosts/hydrogen
          
	  home-manager.nixosModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.davide = import ./hosts/hydrogen/users/davide-home.nix;
	    home-manager.users.host = import ./hosts/hydrogen/users/host-home.nix;
	  }	
	];
      };
    };
  };
}
