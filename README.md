# dotfiles

## Getting started

### Prerequisites

Install Nix: [multi-user installation](https://nix.dev/install-nix)

Install Nix home-manager: [standalone installation](https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone)

### Installation

From the root of the repository, run the following command to symlink the dotfiles to the `XDG_CONFIG_HOME` directory:

```bash
stow .
```

Temporarily, run the following command to symlink the `.zshrc` file to the home directory:

```bash
ln -s $(pwd)/zsh/.zshrc ~/.zshrc
```
