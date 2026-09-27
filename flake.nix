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
      url = "github:spotdemo4/go-template/52dcea4937fb74b42e2bf9aa2b0d89afc0be414b";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    node-template = {
      url = "github:spotdemo4/node-template/a42232e4e9e29a4f60eb6d73367c390ff4a273af";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    rust-template = {
      url = "github:spotdemo4/rust-template/fe76fd048577c505e9a81ad09bf2734612dbedfb";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    python-template = {
      url = "github:spotdemo4/python-template/968c91e694c7799e8247c35a9d741cd7f5348b71";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    gleam-template = {
      url = "github:spotdemo4/gleam-template/e748ec9b7329cce965ae557149d45d791152d78e";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    zig-template = {
      url = "github:spotdemo4/zig-template/5fb2ee3fb2d417ea2af3fa45002c9e9c5ce3ba8e";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    cpp-template = {
      url = "github:spotdemo4/cpp-template/0df320cfe02c58968ff167b1b8ea0521e3a3e278";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    template = {
      url = "github:spotdemo4/template/d40bc9c8d957567e185ffa100cd66769d7a94406";
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
