{
  description = "templates";

  nixConfig = {
    extra-substituters = [
      "https://cache.trev.zip/nur"
    ];
    extra-trusted-public-keys = [
      "nur:70xGHUW1+1b8FqBchldaunN//pZNVo6FKuPL4U/n844="
    ];
  };

  inputs = {
    systems.url = "github:nix-systems/default";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };
    nur = {
      url = "github:spotdemo4/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # templates
    go-template.url = "github:spotdemo4/go-template";
    svelte-template.url = "github:spotdemo4/svelte-template";
    node-template.url = "github:spotdemo4/node-template";
  };

  outputs =
    {
      nixpkgs,
      utils,
      nur,

      # templates
      go-template,
      svelte-template,
      node-template,

      ...
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            nur.overlays.packages
            nur.overlays.libs
          ];
        };
      in
      {
        devShells = {
          default = pkgs.mkShell {
            packages = with pkgs; [
              nixfmt
            ];
            shellHook = pkgs.shellhook.ref;
          };

          update = pkgs.mkShell {
            packages = with pkgs; [
              renovate
            ];
          };

          vulnerable = pkgs.mkShell {
            packages = with pkgs; [
              flake-checker
            ];
          };
        };

        checks = pkgs.lib.mkChecks {
          nix = {
            src = ./.;
            deps = with pkgs; [
              nixfmt-tree
            ];
            script = ''
              treefmt --ci
            '';
          };

          actions = {
            src = ./.;
            deps = with pkgs; [
              prettier
              action-validator
              renovate
            ];
            script = ''
              prettier --check .
              action-validator .github/**/*.yaml
              renovate-config-validator .github/renovate.json
            '';
          };
        };

        formatter = pkgs.nixfmt-tree;
      }
    )
    // {
      templates = rec {
        default = go;

        go = {
          path = go-template;
          description = "trev's go template";
          welcomeText = builtins.readFile "${go-template}/.github/README.md";
        };

        svelte = {
          path = svelte-template;
          description = "trev's svelte template";
          welcomeText = builtins.readFile "${svelte-template}/.github/README.md";
        };

        node = {
          path = node-template;
          description = "trev's node template";
          welcomeText = builtins.readFile "${node-template}/.github/README.md";
        };
      };
    };
}
