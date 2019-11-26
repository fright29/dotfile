#!/bin/sh

echo "The dotfiles path: "
echo $PWD


ln -sf $PWD/zshrc ~/.zshrc
ln -sf $PWD/gitconfig ~/.gitconfig
ln -sf $PWD/screenrc ~/.screenrc
ln -sf $PWD/vimrc ~/.vimrc

