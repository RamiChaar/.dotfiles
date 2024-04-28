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
PS1='[\t]'
PS1+='\[\033[38;5;3m\][\[\033[38;5;6m\]\u@\h \[\033[38;5;2m\]/\W\[\033[38;5;3m\]]'
PS1+='\[\033[38;5;1m\]$(__git_ps1 "(%s)") '
PS1+='\[\033[38;5;15m\]\$ \[\033[38;5;187m\]'

# aliases
alias edit="nvim /Users/rami/.bashrc" # editing this file
alias reload="source /Users/rami/.bashrc" # resource bash file

# navigation
alias dev="cd /Users/rami/Library/Mobile\ Documents/com\~apple\~CloudDocs/Developer"

# selenium autotrader
alias edit-trade="nvim /Users/rami/Library/Mobile\ Documents/com\~apple\~CloudDocs/Developer/scripts/selenium-auto-trader/commands.txt"
alias run-trade="conda activate revs && python3 /Users/rami/Library/Mobile\ Documents/com\~apple\~CloudDocs/Developer/scripts/selenium-auto-trader/run.py"

# mail splits
alias mail-splits="conda activate revs && python3 /Users/rami/Library/Mobile\ Documents/com~apple~CloudDocs/Developer/scripts/reverse-split-emailer/mailSplits.py"

# git
alias view-branches="git log --graph --oneline --decorate --all"

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
