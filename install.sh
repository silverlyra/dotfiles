#!/usr/bin/env bash

apply() {
  local src="$(pwd)/$1"
  local dest="${HOME}/.$(basename "$1")"

  ln -fns "$src" "$dest"
}

apply gitconfig
apply zsh/zplugins
apply zsh/zmodules
apply zsh/zshenv
apply zsh/zshrc
apply zsh/zlogin

mkdir -p ~/.config
ln -fns "$(pwd)/alacritty" ~/.config/alacritty
ln -fns "$(pwd)/nvim" ~/.config/nvim
ln -fns "$(pwd)/tmux" ~/.config/tmux

if ! command -v antibody >/dev/null; then
  # Install Antibody (zsh plugin manager)
  mkdir -p ~/.local/bin
  curl -fsSL https://git.io/antibody | sh -s - -b ~/.local/bin
fi