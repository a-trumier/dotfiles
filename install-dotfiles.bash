#!/bin/bash

# simple script to install the dotfiles.
#
# Author: Alex Trumier
# Email: adtrumier@protonmail.com

GIT_TOPLEVEL=$(git rev-parse --show-toplevel)
if [ $? -ne 0 ]
then
    echo "Error: not in a git repository" 2>&1
    exit 1
fi

GIT_ORIG_URL=$(git remote get-url origin)
if [ $? -ne 0 ]
then
    echo "Error: current git repo doesn't have a remote called origin" 2>&1
    exit 1
fi

# pretty hacky way to get between the last slash and dot.
GIT_ORIG_NAME=$(echo $GIT_ORIG_URL | awk -F'[/]' '{print $NF}' | \
    awk -F'[.]' '{print $1}')
if ! [[ $GIT_ORIG_NAME == "dotfiles" ]]
then
    echo "Error: git repo origin not called dotfiles" 2>&1
    exit 1
fi

mkdir -p .config/i3
mkdir -p .config/i3status
mkdir -p .config/qman
mkdir -p .local/share/fonts/

cp i3dot/i3/* ~/.config/i3/
cp i3dot/i3status/* ~/.config/i3status/ 
cp vimrc ~/.vimrc
cp bashrc ~/.bashrc
cp tmux.conf ~/.tmux.conf
cp Xresources ~/.Xresources
cp zshrc ~/.zshrc
cp asoundrc ~/.asoundrc
cp qman.conf ~/.config/qman/
cp -r fonts ~/.local/share/fonts

xrdb -merge ~/.Xresources
