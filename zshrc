# Created by newuser for 5.9function git_branch_name()
function parse_git_branch()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo $branch
  fi
}
# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

export PATH="$PATH:$HOME/progs/bin"
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

setopt prompt_subst
NEWLINE=$'\n'
PROMPT='${NEWLINE}[ %~ | $(parse_git_branch) ] '
RPROMPT="%M"
export TERM=xterm-256color

EDITOR=/usr/bin/vim
alias :q=exit
alias man=qman

alias cls="clear; ls"
alias l="ls -CF"
alias ls="ls --color=auto"
alias clean="make clean"
alias pd="popd"
alias cd="pushd"
alias dirs="dirs -p"
alias vi="vim"

precmd() {   
    echo -ne "\033]0;$(whoami)@$(hostname)\007"
}
