# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/giacomo/.miniforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/giacomo/.miniforge/etc/profile.d/conda.sh" ]; then
#         . "/Users/giacomo/.miniforge/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/giacomo/.miniforge/bin:$PATH"
#     fi
# fi
# unset __conda_setup

# if [ -f "/Users/giacomo/.miniforge/etc/profile.d/mamba.sh" ]; then
#     . "/Users/giacomo/.miniforge/etc/profile.d/mamba.sh"
# fi
# <<< conda initialize <<<

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
if [[ ":$FPATH:" != *":$HOME/.zsh/completions:"* ]]; then export FPATH="$HOME/.zsh/completions:$FPATH"; fi

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
export EDITOR="zed --wait"

# set config dir
export XDG_CONFIG_HOME="$HOME/.config"

# nix
export NIX_CONF_DIR=$HOME/.config/nix
export PATH=/run/current-system/sw/bin:$PATH

if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
	 . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
