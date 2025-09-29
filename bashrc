# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

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
alias :q=exit
alias man=qman
PROMPT_COMMAND='\
echo -ne "\033]0;$(whoami)@$(hostname):$(pwd)\007"'
    
PS1='\n[ \w ] $ '
#PS1='\[\e[95m\]\s\[\e[0m\]'
#PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'
#PS1='\n\[\e[95m\][ \s | \w | ${PS1_CMD1} ]\[\e[0m\]\n[ \u | \H | $? ] \$ '
#PS1='\n\[\e[95m\]┌[ \s | \w | ${PS1_CMD1} ]\n├[\u | \H | $? ]\n└─⮕ \[\e[0m\]'
alias rgdb=/student/cmpt332/xv6-2025/riscv/bin/riscv64-unknown-linux-gnu-gdb
EDITOR=/usr/bin/vim
alias cls="clear; ls"
alias l="ls -CF"
alias ls="ls --color=auto"
alias clean="make clean"
