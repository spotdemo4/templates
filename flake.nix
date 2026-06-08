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
    trevpkgs = {
      url = "github:spotdemo4/trevpkgs";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
      };
    };

    # templates
    go-template = {
      url = "github:spotdemo4/go-template/feb13b4db5bdd4a2d0b8d2148a5560c45197af4d";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    svelte-template = {
      url = "github:spotdemo4/svelte-template/903c01214c7bd05faa9fdcaaff5b8289ceefd9f7";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    node-template = {
      url = "github:spotdemo4/node-template/b779eedab1145b06b61f8fffa6eeb86110d2ce4c";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    rust-template = {
      url = "github:spotdemo4/rust-template/22e266a0e54bfaf6a8db4fea73ac92cdd3732264";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    python-template = {
      url = "github:spotdemo4/python-template/85991346a7391b6135e1da80c8688f29a6fb6e01";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    gleam-template = {
      url = "github:spotdemo4/gleam-template/16d1c57c144d0d230a714525f44e62d2ade8f4a8";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    zig-template = {
      url = "github:spotdemo4/zig-template/ea8bdf2e302ec276dae8483e673a09ab8a5961e2";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    cpp-template = {
      url = "github:spotdemo4/cpp-template/de1d4cadea997478bfc075b1b3e105a8454dd146";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    template = {
      url = "github:spotdemo4/template/d5185a06a966a13e4f43adaec3c0657506f34225";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
  };

  outputs =
    {
      trevpkgs,

      # templates
      go-template,
      svelte-template,
      node-template,
      rust-template,
      python-template,
      gleam-template,
      zig-template,
      cpp-template,
      template,

      ...
    }:
    trevpkgs.libs.mkFlake (
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
            packages = with pkgs; [
              prettier
            ];
            script = ''
              prettier --check "$file"
            '';
          };

          nix = {
            root = ./.;
            filter = file: file.hasExt "nix";
            packages = with pkgs; [
              nixfmt
            ];
            script = ''
              nixfmt --check "$file"
            '';
          };

          actions = {
            root = ./.github/workflows;
            filter = file: file.hasExt "yaml";
            packages = with pkgs; [
              action-validator
              zizmor
            ];
            script = ''
              action-validator "$file"
              zizmor --offline "$file"
            '';
          };

          renovate = {
            root = ./.github;
            fileset = ./.github/renovate.json;
            packages = with pkgs; [
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
            welcomeText = builtins.readFile "${go-template}/README.md";
          };

          svelte = {
            path = svelte-template;
            description = "trev's svelte template";
            welcomeText = builtins.readFile "${svelte-template}/README.md";
          };

          node = {
            path = node-template;
            description = "trev's node template";
            welcomeText = builtins.readFile "${node-template}/README.md";
          };

          rust = {
            path = rust-template;
            description = "trev's rust template";
            welcomeText = builtins.readFile "${rust-template}/README.md";
          };

          python = {
            path = python-template;
            description = "trev's python template";
            welcomeText = builtins.readFile "${python-template}/README.md";
          };

          gleam = {
            path = gleam-template;
            description = "trev's gleam template";
            welcomeText = builtins.readFile "${gleam-template}/README.md";
          };

          zig = {
            path = zig-template;
            description = "trev's zig template";
            welcomeText = builtins.readFile "${zig-template}/README.md";
          };

          cpp = {
            path = cpp-template;
            description = "trev's cpp template";
            welcomeText = builtins.readFile "${cpp-template}/README.md";
          };

          default = {
            path = template;
            description = "trev's default template";
            welcomeText = builtins.readFile "${template}/README.md";
          };
        };

        schemas = trevpkgs.schemas // {
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
