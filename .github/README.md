# nix dev templates

![check](https://github.com/spotdemo4/templates/actions/workflows/check.yaml/badge.svg)
![vulnerable](https://github.com/spotdemo4/templates/actions/workflows/vulnerable.yaml/badge.svg)

Jumping off templates for various languages. Includes automated formatting, linting, updates and releases. Built around [nix](https://nixos.org/) flakes.

## Languages

### Go

[spotdemo4/go-template](https://github.com/spotdemo4/go-template/)

```elm
nix flake init --template github:spotdemo4/templates#go
```

### Svelte

[spotdemo4/svelte-template](https://github.com/spotdemo4/svelte-template/)

```elm
nix flake init --template github:spotdemo4/templates#svelte
```

### Node

[spotdemo4/node-template](https://github.com/spotdemo4/node-template/)

```elm
nix flake init --template github:spotdemo4/templates#node
```

### Rust

[spotdemo4/rust-template](https://github.com/spotdemo4/rust-template/)

```elm
nix flake init --template github:spotdemo4/templates#rust
```

### Python

[spotdemo4/python-template](https://github.com/spotdemo4/python-template/)

```elm
nix flake init --template github:spotdemo4/templates#python
```

### Default

[spotdemo4/template](https://github.com/spotdemo4/template/)

```elm
nix flake init --template github:spotdemo4/templates
```

## Recommendations

- [direnv](https://direnv.net/)
- [nix-direnv](https://github.com/nix-community/nix-direnv)

### GitHub

- Create a [GitHub app for renovate](https://docs.renovatebot.com/modules/platform/github/#running-as-a-github-app)
- Set `vars.CLIENT_ID` & `secrets.PRIVATE_KEY` in the repository settings
- Create a branch protection ruleset for `main` that requires the `check` status check to pass

### Gitea

- Create a [bot account for renovate](https://docs.renovatebot.com/modules/platform/gitea/)
- Set `secrets.RENOVATE_TOKEN` in the repository settings
- Create a read-only GitHub token and set `secrets.GH_TOKEN` in the repository settings
- Create a branch protection rule for `main` that requires the `check` status check to pass
