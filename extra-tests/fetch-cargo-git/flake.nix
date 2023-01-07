{
  inputs = {
    crane.url = "github:ipetkov/crane";
    nixpkgs.follows = "crane/nixpkgs";
    flake-utils.follows = "crane/flake-utils";
  };

  outputs = { flake-utils, crane, nixpkgs, ... }: flake-utils.lib.eachDefaultSystem
    (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.cargo-git = crane.lib.x86_64-linux.downloadCargoPackageFromGit {
          git = "https://github.com/rust-lang/cargo";
          rev = "17f8088d6eafd82349630a8de8cc6efe03abf5fb";
        };
      });
}