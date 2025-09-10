{
  description = "templates";

  nixConfig = {
    extra-substituters = [
      "https://trevnur.cachix.org"
    ];
    extra-trusted-public-keys = [
      "trevnur.cachix.org-1:hBd15IdszwT52aOxdKs5vNTbq36emvEeGqpb25Bkq6o="
    ];
  };

  inputs = {
    systems.url = "systems";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };
    nur = {
      url = "github:spotdemo4/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    self.submodules = true;
  };

  outputs = {
    nixpkgs,
    utils,
    nur,
    ...
  }:
    utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [nur.overlays.default];
      };
    in {
      devShells = {
        default = pkgs.mkShell {
          shellHook = pkgs.trev.shellhook.ref;
        };

        update = pkgs.mkShell {
          packages = with pkgs; [
            trev.renovate
          ];
        };

        vulnerable = pkgs.mkShell {
          packages = with pkgs; [
            flake-checker
          ];
        };
      };

      checks = pkgs.trev.lib.mkChecks {
        nix = {
          src = ./.;
          deps = with pkgs; [
            alejandra
          ];
          script = ''
            alejandra -c .
          '';
        };

        actions = {
          src = ./.;
          deps = with pkgs; [
            prettier
            action-validator
            trev.renovate
          ];
          script = ''
            prettier --check .
            action-validator .github/**/*.yaml
            renovate-config-validator .github/renovate.json
          '';
        };
      };

      formatter = pkgs.alejandra;
    })
    // {
      templates = rec {
        default = go;

        go = {
          path = ./go;
          description = "trev's Go template";
          welcomeText = ''
            # trev's Go Template
            wip
          '';
        };
      };
    };
}
