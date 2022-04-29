export ZSH="$HOME/.oh-my-zsh"
export HOMEBREW_HOME="/opt/homebrew/bin"
#ZSH_THEME=muse
#ZSH_THEME=steeef
ZSH_THEME=lambda-mod
#ZSH_THEME=kolo
#ZSH_THEME=simple

plugins=()

source $ZSH/oh-my-zsh.sh

# User configuration
set -o vi
export EDITOR="nvim"
export VISUAL="code"
unsetopt correctall

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.local/bin:$HOMEBREW_HOME:$PATH:$HOME/bin:$PYENV_ROOT/bin:$PATH"

[ -f "$HOMEBREW_HOME/nvim" ] && alias vi=nvim
[ -f "/Users/ethan/.nvm/versions/node/v14.16.1/bin/diff-so-fancy" ] && alias diff="diff-so-fancy"
[ -f "$HOMEBREW_HOME/exa" ] && alias ls="exa -bl --git --icons --time-style long-iso --group-directories-first"
[ -f "$HOMEBREW_HOME/hub" ] && alias git=hub
[ -f "$HOMEBREW_HOME/bat" ] && alias cat=bat

alias f=ranger
eval "$(pyenv init --path)"
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias gam="/Users/ethan/bin/gamadv-xtd3/gam"
