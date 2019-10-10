#!/bin/sh

if [ "$(uname)" == 'Darwin' ]; then
    OS='Mac'
    ln -sf ~/dotfiles/vim/vimrc.vim ~/.vimrc
    ln -sf ~/dotfiles/vim/gvimrc.vim ~/.gvimrc
    ln -sf ~/dotfiles/bash/bashrc ~/.bashrc
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    OS='Linux'
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
    OS='Cygwin'
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

echo "dotfiles has been updated"
