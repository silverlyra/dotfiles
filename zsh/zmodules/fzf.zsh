if [[ -d /opt/homebrew/opt/fzf ]]; then
  # Auto-completion
  [[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

  # Key bindings
  source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
fi
