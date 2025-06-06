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
alias ls="eza -a --long --no-filesize --icons=always --no-time --no-user --no-permissions --group-directories-first"
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
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
