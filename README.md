# nix dev templates

Jumping off templates for various languages. Includes automated formatting, linting, updates and releases. Built around [nix](https://nixos.org/) flakes.

### GitHub

- Create a [GitHub app for renovate](https://docs.renovatebot.com/modules/platform/github/#running-as-a-github-app)
- Set `vars.CLIENT_ID` & `secrets.PRIVATE_KEY` using the GitHub app credentials
- Create a branch protection ruleset for `main` that requires the `check` status check to pass

### Forgejo / Gitea

- Create a [bot account for renovate](https://docs.renovatebot.com/modules/platform/gitea/) and create an access token for `secrets.RENOVATE_TOKEN`
- Create an access token for `secrets.DOCTOR_TOKEN`
- Create an access token for `secrets.PACKAGE_TOKEN`
- Create a read-only GitHub token for `secrets.GH_TOKEN`
- Create a branch protection rule for `main` that requires the `check` status check to pass

## Go

[![check](https://img.shields.io/github/actions/workflow/status/spotdemo4/go-template/check.yaml?branch=main&logo=github&logoColor=%23bac2de&label=check&labelColor=%23313244)](https://github.com/spotdemo4/go-template/actions/workflows/check.yaml)
[![vulnerable](https://img.shields.io/github/actions/workflow/status/spotdemo4/go-template/vulnerable.yaml?branch=main&logo=github&logoColor=%23bac2de&label=vulnerable&labelColor=%23313244)](https://github.com/spotdemo4/go-template/actions/workflows/vulnerable.yaml)
[![nixpkgs](https://nix-shield.trev.zip/?url=https://raw.githubusercontent.com/spotdemo4/go-template/refs/heads/main/flake.lock&input=nixpkgs&logoColor=%23bac2de&labelColor=%23313244&color=%235277C3)](https://nixos.org/)
[![go](https://img.shields.io/github/go-mod/go-version/spotdemo4/go-template?logo=go&logoColor=%23bac2de&label=version&labelColor=%23313244&color=%2300ADD8)](https://go.dev/doc/devel/release)

[trev.zip/template/go](https://trev.zip/template/go) ([GitHub mirror](https://github.com/spotdemo4/go-template))

```elm
nix flake init -t git+https://trev.zip/template/go
```

## Node

[![check](https://img.shields.io/github/actions/workflow/status/spotdemo4/node-template/check.yaml?branch=main&logo=github&logoColor=%23bac2de&label=check&labelColor=%23313244)](https://github.com/spotdemo4/node-template/actions/workflows/check.yaml)
[![vulnerable](https://img.shields.io/github/actions/workflow/status/spotdemo4/node-template/vulnerable.yaml?branch=main&logo=github&logoColor=%23bac2de&label=vulnerable&labelColor=%23313244)](https://github.com/spotdemo4/node-template/actions/workflows/vulnerable.yaml)
[![nixpkgs](https://nix-shield.trev.zip/?url=https://raw.githubusercontent.com/spotdemo4/node-template/refs/heads/main/flake.lock&input=nixpkgs&logoColor=%23bac2de&labelColor=%23313244&color=%235277C3)](https://nixos.org/)
[![node](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2Fspotdemo4%2Fnode-template%2Frefs%2Fheads%2Fmain%2Fpackage.json&query=%24.engines.node&logo=nodedotjs&logoColor=%23bac2de&label=version&labelColor=%23313244&color=%23339933)](https://nodejs.org/en/about/previous-releases)

[trev.zip/template/node](https://trev.zip/template/node) ([GitHub mirror](https://github.com/spotdemo4/node-template))

```elm
nix flake init -t git+https://trev.zip/template/node
```

## Rust

[![check](https://img.shields.io/github/actions/workflow/status/spotdemo4/rust-template/check.yaml?branch=main&logo=github&logoColor=%23bac2de&label=check&labelColor=%23313244)](https://github.com/spotdemo4/rust-template/actions/workflows/check.yaml)
[![vulnerable](https://img.shields.io/github/actions/workflow/status/spotdemo4/rust-template/vulnerable.yaml?branch=main&logo=github&logoColor=%23bac2de&label=vulnerable&labelColor=%23313244)](https://github.com/spotdemo4/rust-template/actions/workflows/vulnerable.yaml)
[![nixpkgs](https://nix-shield.trev.zip/?url=https://raw.githubusercontent.com/spotdemo4/rust-template/refs/heads/main/flake.lock&input=nixpkgs&logoColor=%23bac2de&labelColor=%23313244&color=%235277C3)](https://nixos.org/)
[![rust](https://img.shields.io/badge/dynamic/toml?url=https%3A%2F%2Fraw.githubusercontent.com%2Fspotdemo4%2Frust-template%2Frefs%2Fheads%2Fmain%2FCargo.toml&query=%24.package.rust-version&logo=rust&logoColor=%23bac2de&label=version&labelColor=%23313244&color=%23D34516)](https://releases.rs/)

[trev.zip/template/rust](https://trev.zip/template/rust) ([GitHub mirror](https://github.com/spotdemo4/rust-template))

```elm
nix flake init -t git+https://trev.zip/template/rust
```

## Python

[![check](https://img.shields.io/github/actions/workflow/status/spotdemo4/python-template/check.yaml?branch=main&logo=github&logoColor=%23bac2de&label=check&labelColor=%23313244)](https://github.com/spotdemo4/python-template/actions/workflows/check.yaml)
[![vulnerable](https://img.shields.io/github/actions/workflow/status/spotdemo4/python-template/vulnerable.yaml?branch=main&logo=github&logoColor=%23bac2de&label=vulnerable&labelColor=%23313244)](https://github.com/spotdemo4/python-template/actions/workflows/vulnerable.yaml)
[![nixpkgs](https://nix-shield.trev.zip/?url=https://raw.githubusercontent.com/spotdemo4/python-template/refs/heads/main/flake.lock&input=nixpkgs&logoColor=%23bac2de&labelColor=%23313244&color=%235277C3)](https://nixos.org/)
[![python](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fraw.githubusercontent.com%2Fspotdemo4%2Fpython-template%2Frefs%2Fheads%2Fmain%2F.python-version&search=(.*)&logo=python&logoColor=%23bac2de&label=version&labelColor=%23313244&color=%23306998>)](https://www.python.org/downloads/)

[trev.zip/template/python](https://trev.zip/template/python) ([GitHub mirror](https://github.com/spotdemo4/python-template))

```elm
nix flake init -t git+https://trev.zip/template/python
```

## Gleam

[![check](https://img.shields.io/github/actions/workflow/status/spotdemo4/gleam-template/check.yaml?branch=main&logo=github&logoColor=%23bac2de&label=check&labelColor=%23313244)](https://github.com/spotdemo4/gleam-template/actions/workflows/check.yaml)
[![vulnerable](https://img.shields.io/github/actions/workflow/status/spotdemo4/gleam-template/vulnerable.yaml?branch=main&logo=github&logoColor=%23bac2de&label=vulnerable&labelColor=%23313244)](https://github.com/spotdemo4/gleam-template/actions/workflows/vulnerable.yaml)
[![nixpkgs](https://nix-shield.trev.zip/?url=https://raw.githubusercontent.com/spotdemo4/gleam-template/refs/heads/main/flake.lock&input=nixpkgs&logoColor=%23bac2de&labelColor=%23313244&color=%235277C3)](https://nixos.org/)
[![gleam](https://img.shields.io/badge/dynamic/toml?url=https%3A%2F%2Fraw.githubusercontent.com%2Fspotdemo4%2Fgleam-template%2Frefs%2Fheads%2Fmain%2Fgleam.toml&query=%24.gleam&logo=gleam&logoColor=%23bac2de&label=version&labelColor=%23313244&color=%23FFAFF3)](https://gleam.run/)

[trev.zip/template/gleam](https://trev.zip/template/gleam) ([GitHub mirror](https://github.com/spotdemo4/gleam-template))

```elm
nix flake init -t git+https://trev.zip/template/gleam
```

## Zig

[![check](https://img.shields.io/github/actions/workflow/status/spotdemo4/zig-template/check.yaml?branch=main&logo=github&logoColor=%23bac2de&label=check&labelColor=%23313244)](https://github.com/spotdemo4/zig-template/actions/workflows/check.yaml)
[![vulnerable](https://img.shields.io/github/actions/workflow/status/spotdemo4/zig-template/vulnerable.yaml?branch=main&logo=github&logoColor=%23bac2de&label=vulnerable&labelColor=%23313244)](https://github.com/spotdemo4/zig-template/actions/workflows/vulnerable.yaml)
[![nixpkgs](https://nix-shield.trev.zip/?url=https://raw.githubusercontent.com/spotdemo4/zig-template/refs/heads/main/flake.lock&input=nixpkgs&logoColor=%23bac2de&labelColor=%23313244&color=%235277C3)](https://nixos.org/)
[![zig](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fraw.githubusercontent.com%2Fspotdemo4%2Fzig-template%2Frefs%2Fheads%2Fmain%2Fbuild.zig.zon&search=.minimum_zig_version%20%3D%20%22(.*)%22&replace=%241&logo=zig&logoColor=%23bac2de&label=version&labelColor=%23313244&color=%23F7A41D>)](https://ziglang.org/)

[trev.zip/template/zig](https://trev.zip/template/zig) ([GitHub mirror](https://github.com/spotdemo4/zig-template))

```elm
nix flake init -t git+https://trev.zip/template/zig
```

## C++

[![check](https://img.shields.io/github/actions/workflow/status/spotdemo4/cpp-template/check.yaml?branch=main&logo=github&logoColor=%23bac2de&label=check&labelColor=%23313244)](https://github.com/spotdemo4/cpp-template/actions/workflows/check.yaml)
[![vulnerable](https://img.shields.io/github/actions/workflow/status/spotdemo4/cpp-template/vulnerable.yaml?branch=main&logo=github&logoColor=%23bac2de&label=vulnerable&labelColor=%23313244)](https://github.com/spotdemo4/cpp-template/actions/workflows/vulnerable.yaml)
[![nixpkgs](https://nix-shield.trev.zip/?url=https://raw.githubusercontent.com/spotdemo4/cpp-template/refs/heads/main/flake.lock&input=nixpkgs&logoColor=%23bac2de&labelColor=%23313244&color=%235277C3)](https://nixos.org/)
[![cpp](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fraw.githubusercontent.com%2Fspotdemo4%2Fcpp-template%2Frefs%2Fheads%2Fmain%2FCMakeLists.txt&search=set%5C(CMAKE_CXX_STANDARD%20(.*%3F)%5C)&replace=C%2B%2B%241&logo=cplusplus&logoColor=%23bac2de&label=version&labelColor=%23313244&color=%2300599C>)](https://isocpp.org/std/status)

[trev.zip/template/cpp](https://trev.zip/template/cpp) ([GitHub mirror](https://github.com/spotdemo4/cpp-template))

```elm
nix flake init -t git+https://trev.zip/template/cpp
```

## Kotlin

[![check](https://img.shields.io/github/actions/workflow/status/spotdemo4/kotlin-template/check.yaml?branch=main&logo=github&logoColor=%23bac2de&label=check&labelColor=%23313244)](https://github.com/spotdemo4/kotlin-template/actions/workflows/check.yaml)
[![vulnerable](https://img.shields.io/github/actions/workflow/status/spotdemo4/kotlin-template/vulnerable.yaml?branch=main&logo=github&logoColor=%23bac2de&label=vulnerable&labelColor=%23313244)](https://github.com/spotdemo4/kotlin-template/actions/workflows/vulnerable.yaml)
[![nixpkgs](https://nix-shield.trev.zip/?url=https://raw.githubusercontent.com/spotdemo4/kotlin-template/refs/heads/main/flake.lock&input=nixpkgs&logoColor=%23bac2de&labelColor=%23313244&color=%235277C3)](https://nixos.org/)
[![kotlin](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fraw.githubusercontent.com%2Fspotdemo4%2Fkotlin-template%2Frefs%2Fheads%2Fmain%2Fbuild.gradle.kts&search=kotlin%5C(%22jvm%22%5C)%20version%20%22(.*)%22&replace=%241&logo=kotlin&logoColor=%23bac2de&label=version&labelColor=%23313244&color=%237F52FF>)](https://kotlinlang.org/docs/releases.html)

[trev.zip/template/kotlin](https://trev.zip/template/kotlin) ([GitHub mirror](https://github.com/spotdemo4/kotlin-template))

```elm
nix flake init -t git+https://trev.zip/template/kotlin
```

## TrevStack

[![check](https://img.shields.io/github/actions/workflow/status/spotdemo4/trevstack/check.yaml?branch=main&logo=github&logoColor=%23bac2de&label=check&labelColor=%23313244)](https://github.com/spotdemo4/trevstack/actions/workflows/check.yaml)
[![vulnerable](https://img.shields.io/github/actions/workflow/status/spotdemo4/trevstack/vulnerable.yaml?branch=main&logo=github&logoColor=%23bac2de&label=vulnerable&labelColor=%23313244)](https://github.com/spotdemo4/trevstack/actions/workflows/vulnerable.yaml)
[![nixpkgs](https://nix-shield.trev.zip/?url=https://raw.githubusercontent.com/spotdemo4/trevstack/refs/heads/main/flake.lock&input=nixpkgs&logoColor=%23bac2de&labelColor=%23313244&color=%235277C3)](https://nixos.org/)
[![go](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fraw.githubusercontent.com%2Fspotdemo4%2Ftrevstack%2Frefs%2Fheads%2Fmain%2Fserver%2Fgo.mod&search=toolchain%20go(.*)&replace=%241&logo=go&logoColor=%23bac2de&label=version&labelColor=%23313244&color=%2300ADD8>)](https://go.dev/doc/devel/release)
[![node](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2Fspotdemo4%2Ftrevstack%2Frefs%2Fheads%2Fmain%2Fweb%2Fpackage.json&query=%24.engines.node&logo=nodedotjs&logoColor=%23bac2de&label=version&labelColor=%23313244&color=%23339933)](https://nodejs.org/en/about/previous-releases)
[![solidjs](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2Fspotdemo4%2Ftrevstack%2Frefs%2Fheads%2Fmain%2Fweb%2Fpackage.json&query=%24.dependencies.solid-js&logo=solid&logoColor=%23bac2de&label=version&labelColor=%23313244&color=%232C4F7C)](https://www.solidjs.com/)
[![rust](https://img.shields.io/badge/dynamic/toml?url=https%3A%2F%2Fraw.githubusercontent.com%2Fspotdemo4%2Ftrevstack%2Frefs%2Fheads%2Fmain%2Fclient%2FCargo.toml&query=%24.package.rust-version&logo=rust&logoColor=%23bac2de&label=version&labelColor=%23313244&color=%23D34516)](https://releases.rs/)

Full-stack applications built with [Go](https://go.dev/), [Rust](https://rust-lang.org/), [SolidJS](https://www.solidjs.com/) and [ConnectRPC](https://connectrpc.com/).

[trev.zip/template/stack](https://trev.zip/template/stack) ([GitHub mirror](https://github.com/spotdemo4/trevstack))

```elm
nix flake init -t git+https://trev.zip/template/stack
```

## Default

[![check](https://img.shields.io/github/actions/workflow/status/spotdemo4/template/check.yaml?branch=main&logo=github&logoColor=%23bac2de&label=check&labelColor=%23313244)](https://github.com/spotdemo4/template/actions/workflows/check.yaml)
[![vulnerable](https://img.shields.io/github/actions/workflow/status/spotdemo4/template/vulnerable.yaml?branch=main&logo=github&logoColor=%23bac2de&label=vulnerable&labelColor=%23313244)](https://github.com/spotdemo4/template/actions/workflows/vulnerable.yaml)
[![nixpkgs](https://nix-shield.trev.zip/?url=https://raw.githubusercontent.com/spotdemo4/template/refs/heads/main/flake.lock&input=nixpkgs&logoColor=%23bac2de&labelColor=%23313244&color=%235277C3)](https://nixos.org/)

[trev.zip/template/default](https://trev.zip/template/default) ([GitHub mirror](https://github.com/spotdemo4/template))

```elm
nix flake init -t git+https://trev.zip/template/default
```
