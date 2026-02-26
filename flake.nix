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
      url = "github:spotdemo4/go-template/92df2caaedf515c746672798307ea9dc4c891375";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    svelte-template = {
      url = "github:spotdemo4/svelte-template/722fd9464187ecb2033714b2f14872d59772a0c8";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    node-template = {
      url = "github:spotdemo4/node-template/5ac46efeb2deb6dd27c2ecf44dd30d08548a2831";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    rust-template = {
      url = "github:spotdemo4/rust-template/269cf8a14af8a46549eccb68b448850bc4117b20";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    python-template = {
      url = "github:spotdemo4/python-template/3ace41dd0b25b0f5fb199d93d9836918bb6eabb2";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    gleam-template = {
      url = "github:spotdemo4/gleam-template/321a68c5eb990d30b1aba1692104ef2637677c66";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    template = {
      url = "github:spotdemo4/template/b75099537bf810cbf4d39bb6c80b58cf6a0072f6";
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
