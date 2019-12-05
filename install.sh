#!/bin/sh

echo "The dotfiles path: "
echo $PWD

ln -s $PWD/oh-my-zsh ~/.oh-my-zsh
ln -sf $PWD/zshrc ~/.zshrc
ln -sf $PWD/gitconfig ~/.gitconfig
ln -sf $PWD/screenrc ~/.screenrc
ln -sf $PWD/vimrc ~/.vimrc

