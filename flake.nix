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
      url = "github:spotdemo4/go-template/2ec9163fd425403486bf4151ca0872310d5cb587";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    svelte-template = {
      url = "github:spotdemo4/svelte-template/d71f2e4111a748c350548f76a25f38ee7f385945";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    node-template = {
      url = "github:spotdemo4/node-template/5a0afa6b1cdefb63ee3e1b48d1af0b90cd1e42ef";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    rust-template = {
      url = "github:spotdemo4/rust-template/7e5cefcf86172a3029ddd1ffed23298154b03cc3";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    python-template = {
      url = "github:spotdemo4/python-template/ad62e1595bac1a328153a6443b1eb91ed4c5fbc3";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    gleam-template = {
      url = "github:spotdemo4/gleam-template/a25b3505d06bc07d2594323dabae03b19dd40e46";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    zig-template = {
      url = "github:spotdemo4/zig-template/151450e7b8afa41004ad876c1a63e1bd685db45b";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    cpp-template = {
      url = "github:spotdemo4/cpp-template/2f291b8210d7e02495c34d013b37731e1e0ee860";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    template = {
      url = "github:spotdemo4/template/906725014df882be76f276734912959b313275e5";
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
