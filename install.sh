#!/usr/bin/env bash

apply() {
  local src dest
  src="$(pwd)/$1"
  dest="${HOME}/${2:-".$(basename "$1")"}"

  if [[ "$dest" == */ ]]; then
    mkdir -p "${dest%/}"
    dest="${dest}$(basename "$1")"
  fi

  ln -fns "$src" "$dest"
}

apply gitconfig
apply zsh/zplugins
apply zsh/zmodules
apply zsh/zshenv
apply zsh/zshrc
apply zsh/zlogin

apply alacritty .config/
apply nvim .config/
apply tmux .config/

if [[ ! -d "${ZDOTDIR:-"$HOME"}/.antidote" ]]; then
  git clone --depth=1 https://github.com/mattmc3/antidote.git "${ZDOTDIR:-"$HOME"}/.antidote"
fi
