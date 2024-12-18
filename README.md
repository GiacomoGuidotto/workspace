# dotfiles

My dotfiles. Powered by Nix and home-manager.

## Getting started (from scratch!)

Install Nix ([docs](https://nix.dev/install-nix)):

```sh
curl -L https://nixos.org/nix/install | sh
```

Install Nix home-manager standalone ([docs](https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone)):

```sh
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```

```sh
nix-shell '<home-manager>' -A install
```

Bootstrap home-manager:

```sh
home-manager switch -f home-manager/home.nix
```
