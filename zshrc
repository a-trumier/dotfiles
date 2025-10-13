# Created by newuser for 5.9

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

NEWLINE=$'\n'
PROMPT="${NEWLINE}[ %~ ] "
RPROMPT="%M"
export TERM=xterm-256color

EDITOR=/usr/bin/vim
alias :q=exit

alias cls="clear; ls"
alias l="ls -CF"
alias ls="ls --color=auto"
alias clean="make clean"
echo -ne "\033]0;$(whoami)@$(hostname)\007"

