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
      url = "github:spotdemo4/go-template/784d78597175621dfe6af2600f0dbb858c204a7a";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    svelte-template = {
      url = "github:spotdemo4/svelte-template/a7f218368c386d5429845051f8b06573d8c4c07c";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    node-template = {
      url = "github:spotdemo4/node-template/8e109943ca101dbf091ac2235b7a0a25c4d4c61d";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    rust-template = {
      url = "github:spotdemo4/rust-template/073debf1ad1c8ea7e33e0baddcba97b7f106f3bf";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    python-template = {
      url = "github:spotdemo4/python-template/5313b9d523fa64529978618f06abf925b0a22da2";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    gleam-template = {
      url = "github:spotdemo4/gleam-template/deb1e87572ec531479bcc3ffca57c9c2ec6bc37d";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    zig-template = {
      url = "github:spotdemo4/zig-template/b022a62820a7d8bee12a571fd2a4b308fd2fe32d";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    cpp-template = {
      url = "github:spotdemo4/cpp-template/d4009e1e4787581a243f9c4af7ff51384ad6429d";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        trevpkgs.follows = "trevpkgs";
      };
    };
    template = {
      url = "github:spotdemo4/template/0d05366110ad51d2cdf5b53779d535375bd2a9c0";
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
