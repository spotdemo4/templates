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
      url = "github:spotdemo4/go-template/0f790e3bbf2261950ff89d7b0e33afdd3ff06b79";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    svelte-template = {
      url = "github:spotdemo4/svelte-template/3f72f13b42438f3cf76340fdf7d1a74ba87d0fbb";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    node-template = {
      url = "github:spotdemo4/node-template/b20da84f4faab5c6f933a27d37005e4b1e1fb1fc";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    rust-template = {
      url = "github:spotdemo4/rust-template/7dcb704cc1c39d99c7f0ea6e29c9342dc993b004";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    python-template = {
      url = "github:spotdemo4/python-template/9f5fa228b810195b4017b552c725f28ab5f60af7";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    gleam-template = {
      url = "github:spotdemo4/gleam-template/0021dcc3f818d3e39e20eb9ad7d94eb4c9f32a3c";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    zig-template = {
      url = "github:spotdemo4/zig-template/6da9e86021a91d3e8759203dafe8b4dfd8df0580";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    template = {
      url = "github:spotdemo4/template/115547b43709c483e5cbc8d4472187c161808196";
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
      zig-template,
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

        zig = {
          path = zig-template;
          description = "trev's zig template";
          welcomeText = builtins.readFile "${zig-template}/.github/README.md";
        };

        default = {
          path = template;
          description = "trev's default template";
          welcomeText = builtins.readFile "${template}/.github/README.md";
        };
      };
    };
}
