# aliases
alias ll="ls -la"
alias cl="clear"
alias x="exit"
alias up="brew update"
alias lz="lazygit"

# navigation
cdl() { cd "$@" && ll; }

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# deno
. "$HOME/.deno/env"
# completions
source <(deno completions zsh)

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ghcup
[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env" # ghcup-env

# go
export GOPATH="$HOME/dev/go"

# android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"

# set default editor
# export EDITOR="zed --wait"

# set config dir
export XDG_CONFIG_HOME="$HOME/.config"

# nix
export NIX_CONF_DIR=$HOME/.config/nix
export PATH=/run/current-system/sw/bin:$PATH

if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
	 . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
