# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# set up prompt
function git_branch_name() {
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '('$branch')'
  fi
}

setopt prompt_subst

PS1='%F{3}[%F{188}%D{%H:%M:%S}%F{3}]'
PS1+='%F{3}[%F{6}%n@%m %F{2}/%1~%F{3}]'
PS1+='%F{1}$(git_branch_name) '
PS1+='%F{15}%B»%b %F{188}'

# aliases
alias clear="clear && printf '\e[3J'"
alias ls="eza -a --long --no-filesize --icons=always --no-time --no-user --no-permissions"
alias edit="nvim /Users/rami/.zshrc"

# navigation
alias cloud="cd /Users/rami/Library/Mobile\ Documents/com\~apple\~CloudDocs/"

# selenium autotrader
alias edit-trade="nvim /Users/rami/Developer/scripts/selenium-auto-trader/commands.txt"
alias run-trade="conda activate revs && python3 /Users/rami/Developer/scripts/selenium-auto-trader/run.py"

# mail splits
alias mail-splits="conda activate revs && python3 /Users/rami/Developer/scripts/reverse-split-emailer/mailSplits.py"

# git
alias view-branches="git log --graph --oneline --decorate --all"

export CONDA_AUTO_ACTIVATE_BASE=false
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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
