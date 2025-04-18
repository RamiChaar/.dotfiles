#!/bin/bash

# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# supress zsh warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# set up prompt
source ~/.git-prompt.sh
PS1='\[\033[38;5;3m\][\[\033[38;5;188m\]\t\[\033[38;5;3m\]]'
PS1+='\[\033[38;5;3m\][\[\033[38;5;6m\]\u@\h \[\033[38;5;2m\]/\W\[\033[38;5;3m\]]'
PS1+='\[\033[38;5;1m\]$(__git_ps1 "(%s)") '
PS1+='\[\033[38;5;15m\]\$ \[\033[38;5;188m\]'

# aliases
alias clear="clear && printf '\e[3J'"
alias ls="eza -a --long --no-filesize --icons=always --no-time --no-user --no-permissions --group-directories-first"
alias edit="nvim /Users/rami/.bashrc" # editing this file

# navigation
alias cloud="cd /Users/rami/Library/Mobile\ Documents/com\~apple\~CloudDocs/"

# selenium autotrader
alias edit-trade="nvim /Users/rami/Developer/scripts/selenium-auto-trader/commands.txt"
alias run-trade="conda activate revs && python3 /Users/rami/Developer/scripts/selenium-auto-trader/run.py"

# mail splits
alias mail-splits="conda activate revs && python3 /Users/rami/Developer/scripts/reverse-split-emailer/mailSplits.py"

# git
alias view-branches="git log --graph --oneline --decorate --all"
alias gitadd="git add . && git restore --staged config/local-rami.js"

export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

export CONDA_AUTO_ACTIVATE_BASE=false
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
