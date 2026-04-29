# nix dev templates

Jumping off templates for various languages. Includes automated formatting, linting, updates and releases. Built around [nix](https://nixos.org/) flakes.

### GitHub

- Create a [GitHub app for renovate](https://docs.renovatebot.com/modules/platform/github/#running-as-a-github-app)
- Set `vars.CLIENT_ID` & `secrets.PRIVATE_KEY` in the repository settings
- Create a branch protection ruleset for `main` that requires the `check` status check to pass

### Gitea

- Create a [bot account for renovate](https://docs.renovatebot.com/modules/platform/gitea/)
- Set `secrets.RENOVATE_TOKEN` in the repository settings
- Create a read-only GitHub token and set `secrets.GH_TOKEN` in the repository settings
- Create a branch protection rule for `main` that requires the `check` status check to pass

## Go

[![check](https://img.shields.io/github/actions/workflow/status/spotdemo4/go-template/check.yaml?branch=main&logo=github&logoColor=%23bac2de&label=check&labelColor=%23313244)](https://github.com/spotdemo4/go-template/actions/workflows/check.yaml/)
[![vulnerable](https://img.shields.io/github/actions/workflow/status/spotdemo4/go-template/vulnerable.yaml?branch=main&logo=github&logoColor=%23bac2de&label=vulnerable&labelColor=%23313244)](https://github.com/spotdemo4/go-template/actions/workflows/vulnerable.yaml)
[![go](https://img.shields.io/github/go-mod/go-version/spotdemo4/go-template?logo=go&logoColor=%23bac2de&label=version&labelColor=%23313244&color=%2300ADD8)](https://go.dev/doc/devel/release)

[spotdemo4/go-template](https://github.com/spotdemo4/go-template/)

```elm
nix flake init -t github:spotdemo4/templates#go
```

## Svelte

[![check](https://img.shields.io/github/actions/workflow/status/spotdemo4/svelte-template/check.yaml?branch=main&logo=github&logoColor=%23bac2de&label=check&labelColor=%23313244)](https://github.com/spotdemo4/svelte-template/actions/workflows/check.yaml/)
[![vulnerable](https://img.shields.io/github/actions/workflow/status/spotdemo4/svelte-template/vulnerable.yaml?branch=main&logo=github&logoColor=%23bac2de&label=vulnerable&labelColor=%23313244)](https://github.com/spotdemo4/svelte-template/actions/workflows/vulnerable.yaml)
[![node](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2Fspotdemo4%2Fsvelte-template%2Frefs%2Fheads%2Fmain%2Fpackage.json&query=%24.engines.node&logo=nodedotjs&logoColor=%23bac2de&label=version&labelColor=%23313244&color=%23339933)](https://nodejs.org/en/about/previous-releases)

[spotdemo4/svelte-template](https://github.com/spotdemo4/svelte-template/)

```elm
nix flake init -t github:spotdemo4/templates#svelte
```

## Node

[![check](https://img.shields.io/github/actions/workflow/status/spotdemo4/node-template/check.yaml?branch=main&logo=github&logoColor=%23bac2de&label=check&labelColor=%23313244)](https://github.com/spotdemo4/node-template/actions/workflows/check.yaml/)
[![vulnerable](https://img.shields.io/github/actions/workflow/status/spotdemo4/node-template/vulnerable.yaml?branch=main&logo=github&logoColor=%23bac2de&label=vulnerable&labelColor=%23313244)](https://github.com/spotdemo4/node-template/actions/workflows/vulnerable.yaml)
[![node](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2Fspotdemo4%2Fnode-template%2Frefs%2Fheads%2Fmain%2Fpackage.json&query=%24.engines.node&logo=nodedotjs&logoColor=%23bac2de&label=version&labelColor=%23313244&color=%23339933)](https://nodejs.org/en/about/previous-releases)

[spotdemo4/node-template](https://github.com/spotdemo4/node-template/)

```elm
nix flake init -t github:spotdemo4/templates#node
```

## Rust

[![check](https://img.shields.io/github/actions/workflow/status/spotdemo4/rust-template/check.yaml?branch=main&logo=github&logoColor=%23bac2de&label=check&labelColor=%23313244)](https://github.com/spotdemo4/rust-template/actions/workflows/check.yaml/)
[![vulnerable](https://img.shields.io/github/actions/workflow/status/spotdemo4/rust-template/vulnerable.yaml?branch=main&logo=github&logoColor=%23bac2de&label=vulnerable&labelColor=%23313244)](https://github.com/spotdemo4/rust-template/actions/workflows/vulnerable.yaml)
[![rust](https://img.shields.io/badge/dynamic/toml?url=https%3A%2F%2Fraw.githubusercontent.com%2Fspotdemo4%2Frust-template%2Frefs%2Fheads%2Fmain%2FCargo.toml&query=%24.package.rust-version&logo=rust&logoColor=%23bac2de&label=version&labelColor=%23313244&color=%23D34516)](https://releases.rs/)

[spotdemo4/rust-template](https://github.com/spotdemo4/rust-template/)

```elm
nix flake init -t github:spotdemo4/templates#rust
```

## Python

[![check](https://img.shields.io/github/actions/workflow/status/spotdemo4/python-template/check.yaml?branch=main&logo=github&logoColor=%23bac2de&label=check&labelColor=%23313244)](https://github.com/spotdemo4/python-template/actions/workflows/check.yaml/)
[![vulnerable](https://img.shields.io/github/actions/workflow/status/spotdemo4/python-template/vulnerable.yaml?branch=main&logo=github&logoColor=%23bac2de&label=vulnerable&labelColor=%23313244)](https://github.com/spotdemo4/python-template/actions/workflows/vulnerable.yaml)
[![python](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fraw.githubusercontent.com%2Fspotdemo4%2Fpython-template%2Frefs%2Fheads%2Fmain%2F.python-version&search=(.*)&logo=python&logoColor=%23bac2de&label=version&labelColor=%23313244&color=%23306998>)](https://www.python.org/downloads/)

[spotdemo4/python-template](https://github.com/spotdemo4/python-template/)

```elm
nix flake init -t github:spotdemo4/templates#python
```

## Gleam

[![check](https://img.shields.io/github/actions/workflow/status/spotdemo4/gleam-template/check.yaml?branch=main&logo=github&logoColor=%23bac2de&label=check&labelColor=%23313244)](https://github.com/spotdemo4/gleam-template/actions/workflows/check.yaml)
[![vulnerable](https://img.shields.io/github/actions/workflow/status/spotdemo4/gleam-template/vulnerable.yaml?branch=main&logo=github&logoColor=%23bac2de&label=vulnerable&labelColor=%23313244)](https://github.com/spotdemo4/gleam-template/actions/workflows/vulnerable.yaml)
[![gleam](https://img.shields.io/badge/dynamic/toml?url=https%3A%2F%2Fraw.githubusercontent.com%2Fspotdemo4%2Fgleam-template%2Frefs%2Fheads%2Fmain%2Fgleam.toml&query=%24.gleam&logo=gleam&logoColor=%23bac2de&label=version&labelColor=%23313244&color=%23FFAFF3)](https://gleam.run/)

[spotdemo4/gleam-template](https://github.com/spotdemo4/gleam-template/)

```elm
nix flake init -t github:spotdemo4/templates#gleam
```

## Zig

[![check](https://img.shields.io/github/actions/workflow/status/spotdemo4/zig-template/check.yaml?branch=main&logo=github&logoColor=%23bac2de&label=check&labelColor=%23313244)](https://github.com/spotdemo4/zig-template/actions/workflows/check.yaml)
[![vulnerable](https://img.shields.io/github/actions/workflow/status/spotdemo4/zig-template/vulnerable.yaml?branch=main&logo=github&logoColor=%23bac2de&label=vulnerable&labelColor=%23313244)](https://github.com/spotdemo4/zig-template/actions/workflows/vulnerable.yaml)
[![zig](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fraw.githubusercontent.com%2Fspotdemo4%2Fzig-template%2Frefs%2Fheads%2Fmain%2Fbuild.zig.zon&search=.minimum_zig_version%20%3D%20%22(.*)%22&replace=%241&logo=zig&logoColor=%23bac2de&label=version&labelColor=%23313244&color=%23F7A41D>)](https://ziglang.org/)

[spotdemo4/zig-template](https://github.com/spotdemo4/zig-template/)

```elm
nix flake init -t github:spotdemo4/templates#zig
```

## Default

[![check](https://img.shields.io/github/actions/workflow/status/spotdemo4/template/check.yaml?branch=main&logo=github&logoColor=%23bac2de&label=check&labelColor=%23313244)](https://github.com/spotdemo4/template/actions/workflows/check.yaml)
[![vulnerable](https://img.shields.io/github/actions/workflow/status/spotdemo4/template/vulnerable.yaml?branch=main&logo=github&logoColor=%23bac2de&label=vulnerable&labelColor=%23313244)](https://github.com/spotdemo4/template/actions/workflows/vulnerable.yaml)

[spotdemo4/template](https://github.com/spotdemo4/template/)

```elm
nix flake init -t github:spotdemo4/templates
```
