# nix dev templates

[![check](https://img.shields.io/github/actions/workflow/status/spotdemo4/templates/check.yaml?branch=main&logo=nixos&logoColor=%2389dceb&label=check&labelColor=%2311111b)](https://github.com/spotdemo4/templates/actions/workflows/check.yaml)
[![vulnerable](https://img.shields.io/github/actions/workflow/status/spotdemo4/templates/vulnerable.yaml?branch=main&label=vulnerable&labelColor=%2311111b)](https://github.com/spotdemo4/templates/actions/workflows/vulnerable.yaml)

Jumping off templates for various languages. Includes automated updates, testing and building. Built around [nix](https://nixos.org/) flakes.

## Languages

### Go

https://github.com/spotdemo4/go-template/

```console
nix flake init --template github:spotdemo4/templates#go
ln -s .envrc.project .envrc
direnv allow
```

## Recommendations

- [direnv](https://direnv.net/)
- [nix-direnv](https://github.com/nix-community/nix-direnv)

### GitHub

- Create a [GitHub app for renovate](https://docs.renovatebot.com/modules/platform/github/#running-as-a-github-app)
- Set `vars.CLIENT_ID` & `secrets.PRIVATE_KEY` in the repository settings
- Create a branch protection ruleset for `main` that requires the `flake` status check to pass

### Gitea

- Create a [bot account for renovate](https://docs.renovatebot.com/modules/platform/gitea/)
- Set `secrets.RENOVATE_TOKEN` in the repository settings
- Create a read-only GitHub token and set `secrets.GH_TOKEN` in the repository settings
- Create a branch protection rule for `main` that requires the `flake` status check to pass
