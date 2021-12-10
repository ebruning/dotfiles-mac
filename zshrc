# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export HOMEBREW_HOME="/opt/homebrew/bin"
ZSH_THEME=powerlevel10k/powerlevel10k

plugins=(git aws)

source $ZSH/oh-my-zsh.sh

# User configuration
set -o nvim
export EDITOR=nvim
unsetopt correctall

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.local/bin:$HOMEBREW_HOME:$PATH:$HOME/bin:$PYENV_ROOT/bin:$PATH"

[ -f "$HOMEBREW_HOME/nvim" ] && alias vi=nvim
[ -f "/Users/ethan/.nvm/versions/node/v14.16.1/bin/diff-so-fancy" ] && alias diff="diff-so-fancy"
[ -f "$HOMEBREW_HOME/exa" ] && alias ls="exa -bl --git --icons --time-style long-iso --group-directories-first"
[ -f "$HOMEBREW_HOME/bin/hub" ] && alias git=hub

alias pwd="ptpwd"
alias mkdir="ptmkdir"
alias touch="pttouch"
alias cp="ptcp"
alias rm="ptrm"
alias f=ranger
eval "$(pyenv init --path)"
eval "$(rbenv init -)"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

unalias gam # remove git plugin alias for gam
function gam() { "/Users/ethan/bin/gam/gam" "$@" ; }
