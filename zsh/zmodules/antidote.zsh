# ${ZDOTDIR:-~}/.zshrc

# Set the root name of the plugins files (.txt and .zsh) antidote will use.
zsh_plugins=${ZDOTDIR:-~}/.zplugins

# Lazy-load antidote from its functions directory.
fpath=(${ZDOTDIR:-~}/.antidote/functions $fpath)
autoload -Uz antidote

autoload -Uz compinit && compinit

# Generate a new static file whenever .zplugins is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins} ]]; then
  antidote bundle <${zsh_plugins} >|${zsh_plugins}.zsh
fi

# Source your static plugins file.
source ${zsh_plugins}.zsh
