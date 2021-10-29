apply() {
  local src="$(pwd)/$1"
  local dest="${HOME}/.$(basename "$1")"

  ln -fns "$src" "$dest"
}

apply gitconfig
apply zsh/zplugins
apply zsh/zmodules
apply zsh/zshrc

mkdir -p ~/.config
ln -fns "$(pwd)/alacritty" ~/.config/alacritty
ln -fns "$(pwd)/nvim" ~/.config/nvim
ln -fns "$(pwd)/tmux" ~/.config/tmux
