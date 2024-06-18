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

if ! command -v antibody >/dev/null; then
  # Install Antibody (zsh plugin manager)
  mkdir -p ~/.local/bin
  curl -fsSL https://git.io/antibody | sh -s - -b ~/.local/bin
fi
