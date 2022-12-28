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

    let
      pythonDeps = [
        python39
        python39Packages.poetry
        python39Packages.black
      ];
      javascriptDeps = [
        nodejs-16_x
        yarn
        nodePackages.prettier
        nodePackages.eslint
      ];
      javaDeps = [
        openjdk11
        (sbt.override { jre = openjdk11; })
      ];
    in

    {

      devShells.${system} = {
        java = mkShell {
          packages = javaDeps;
        };

        python = mkShell {
          packages = pythonDeps;
        };

        javascript = mkShell {
          packages = javascriptDeps;
        };

        omnishell = mkShell {
          packages = javascriptDeps ++ pythonDeps ++ javaDeps;
        };
      };
    };
}

