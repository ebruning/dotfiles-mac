# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export HOMEBREW_HOME="/usr/local/bin"
ZSH_THEME=powerlevel10k/powerlevel10k

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
set -o vi
unsetopt correctall

export PATH="$PATH:$HOME/bin"

eval "$(rbenv init -)"

[ -f "$HOMEBREW_HOME/nvim" ] && alias vi=nvim
[ -f "/Users/ethan/.nvm/versions/node/v14.16.1/bin/diff-so-fancy" ] && alias diff="diff-so-fancy"
[ -f "$HOMEBREW_HOME/exa" ] && alias ls="exa -bl --git --icons --time-style long-iso --group-directories-first"
[ -f "$HOMEBREW_HOME/bin/hub" ] && alias git=hub

eval "$(rbenv init -)"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ethan/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ethan/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ethan/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ethan/google-cloud-sdk/completion.zsh.inc'; fi


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

