{
  description = "Snap Sync";

  inputs = {
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }: 
    utils.lib.eachDefaultSystem (system:
      let 
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        defaultPackage = pkgs.stdenv.mkDerivation {
          name = "snap-sync";
          src = ./.;
          buildPhase = "true";
          installPhase = "make PREFIX=$out";
        };
      }
    );
}