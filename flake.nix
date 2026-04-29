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
    systems.url = "github:spotdemo4/systems";
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
      url = "github:spotdemo4/go-template/c34c639d6641bc11c91061d715d597e9b8f7630d";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    svelte-template = {
      url = "github:spotdemo4/svelte-template/052332da9e978479275438e8a6c81d46189569b3";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    node-template = {
      url = "github:spotdemo4/node-template/2da0302f80346d218e88b0b813af9f256383c63d";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    rust-template = {
      url = "github:spotdemo4/rust-template/0f9ca4ce05938ca8610dd913e0f5ee59f0efbb39";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    python-template = {
      url = "github:spotdemo4/python-template/8b98f671bd18f0387dd85053dbfdeeab163a592a";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    gleam-template = {
      url = "github:spotdemo4/gleam-template/add8493efa76669cb0e4d3bd9750d3b14edfce8a";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    zig-template = {
      url = "github:spotdemo4/zig-template/0b9262ad540a277c536a715281142d7e39af6411";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
    template = {
      url = "github:spotdemo4/template/cafe4ae6d65a64efe67f49aa67530d27c523c44b";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trev.follows = "trev";
      };
    };
  };

  outputs =
    {
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
      system: pkgs: {
        devShells = {
          default = pkgs.mkShell {
            shellHook = pkgs.shellhook.ref;
            packages = with pkgs; [
              # lint
              nixd

              # format
              treefmt
              prettier
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
              flake-checker # nix
              zizmor # actions
            ];
          };
        };

        formatter = pkgs.treefmt.withConfig {
          configFile = ./treefmt.toml;
          runtimeInputs = with pkgs; [
            prettier
            nixfmt
          ];
        };

        checks = pkgs.mkChecks {
          prettier = {
            root = ./.;
            filter = file: file.hasExt "yaml" || file.hasExt "json" || file.hasExt "md";
            deps = with pkgs; [
              prettier
            ];
            forEach = ''
              prettier --check "$file"
            '';
          };

          nix = {
            root = ./.;
            filter = file: file.hasExt "nix";
            deps = with pkgs; [
              nixfmt
            ];
            forEach = ''
              nixfmt --check "$file"
            '';
          };

          actions = {
            root = ./.github/workflows;
            filter = file: file.hasExt "yaml";
            deps = with pkgs; [
              action-validator
              zizmor
            ];
            forEach = ''
              action-validator "$file"
              zizmor --offline "$file"
            '';
          };

          renovate = {
            root = ./.github;
            fileset = ./.github/renovate.json;
            deps = with pkgs; [
              renovate
            ];
            script = ''
              renovate-config-validator renovate.json
            '';
          };
        };

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

        schemas = trev.schemas // {
          templates =
            let
              mkChildren = children: { inherit children; };
            in
            {
              version = 1;
              doc = ''
                The `templates` output provides project templates.
              '';
              roles.nix-template = { };
              defaultAttrPath = [ "default" ];
              inventory =
                output:
                mkChildren (
                  builtins.mapAttrs (templateName: template: {
                    shortDescription = template.description or "";
                    evalChecks.isValidTemplate =
                      template ? path && template ? description && builtins.isString template.description;
                    what = "template";
                  }) output
                );
            };
        };
      }
    );
}
