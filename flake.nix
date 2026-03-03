{
  description = "templates";

  nixConfig = {
    extra-substituters = [
      "https://nix.trev.zip"
    ];
    extra-trusted-public-keys = [
      "trev:I39N/EsnHkvfmsbx8RUW+ia5dOzojTQNCTzKYij1chU="
    ];
  };

  inputs = {
    systems.url = "github:nix-systems/default";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    trev = {
      url = "github:spotdemo4/nur";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
      };
    };

    # templates
    go-template = {
      url = "github:spotdemo4/go-template/58511d3ab3f1c85e5ff19ac6b4f07b562cac9d92";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    svelte-template = {
      url = "github:spotdemo4/svelte-template/5dc7f00eb9d441231068b9eb0b1ecfee7c3c8705";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    node-template = {
      url = "github:spotdemo4/node-template/ade6107e38e81625ed7059d1736df0eb6aae5ee9";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    rust-template = {
      url = "github:spotdemo4/rust-template/a63c2493b8c68085b8d3f3ffbafcc265cc13055a";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    python-template = {
      url = "github:spotdemo4/python-template/6e1f180dcde1f87ec40b746db230f003056ffe22";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    gleam-template = {
      url = "github:spotdemo4/gleam-template/66f83e509631becafa690fbe09320a12fa597533";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    template = {
      url = "github:spotdemo4/template/6078550294d5ddc8ecc9695a3c2ad0e7842c016b";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
  };

  outputs =
    {
      nixpkgs,
      trev,

      # templates
      go-template,
      svelte-template,
      node-template,
      rust-template,
      python-template,
      gleam-template,
      template,

      ...
    }:
    trev.libs.mkFlake (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            trev.overlays.packages
            trev.overlays.libs
          ];
        };
        fs = pkgs.lib.fileset;
      in
      {
        devShells = {
          default = pkgs.mkShell {
            shellHook = pkgs.shellhook.ref;
            packages = with pkgs; [
              nixfmt
            ];
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
            src = fs.toSource {
              root = ./.;
              fileset = fs.fileFilter (file: file.hasExt "nix") ./.;
            };
            deps = with pkgs; [
              nixfmt-tree
            ];
            script = ''
              treefmt --ci
            '';
          };

          actions = {
            src = fs.toSource {
              root = ./.github/workflows;
              fileset = ./.github/workflows;
            };
            deps = with pkgs; [
              action-validator
              octoscan
            ];
            script = ''
              action-validator **/*.yaml
              octoscan scan .
            '';
          };

          renovate = {
            src = fs.toSource {
              root = ./.github;
              fileset = ./.github/renovate.json;
            };
            deps = with pkgs; [
              renovate
            ];
            script = ''
              renovate-config-validator renovate.json
            '';
          };

          prettier = {
            src = fs.toSource {
              root = ./.;
              fileset = fs.fileFilter (file: file.hasExt "yaml" || file.hasExt "json" || file.hasExt "md") ./.;
            };
            deps = with pkgs; [
              prettier
            ];
            script = ''
              prettier --check .
            '';
          };
        };

        formatter = pkgs.nixfmt-tree;
      }
    )
    // {
      templates = {
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

        rust = {
          path = rust-template;
          description = "trev's rust template";
          welcomeText = builtins.readFile "${rust-template}/.github/README.md";
        };

        python = {
          path = python-template;
          description = "trev's python template";
          welcomeText = builtins.readFile "${python-template}/.github/README.md";
        };

        gleam = {
          path = gleam-template;
          description = "trev's gleam template";
          welcomeText = builtins.readFile "${gleam-template}/.github/README.md";
        };

        default = {
          path = template;
          description = "trev's default template";
          welcomeText = builtins.readFile "${template}/.github/README.md";
        };
      };
    };
}
