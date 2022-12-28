{
  description = "A basic flake providing dev shells for Java, Python, and JavaScript";

  inputs = {
    # follow a stable packages release
    nixpkgs.url = "nixpkgs/nixos-22.11";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-darwin";
      pkgs = import nixpkgs { inherit system; };
    in
    with pkgs;
    {

      devShells.${system} = {
        java = mkShell {
          packages =
            [
              openjdk11
              (sbt.override { jre = openjdk11; })
            ];
        };

        python = mkShell {
          packages = [
            python39
            python39Packages.poetry
            python39Packages.black
          ];
        };

        javascript = mkShell {
          packages = [
            yarn
            nodePackages.prettier
            nodePackages.eslint
          ];
        };
      };
    };
}

