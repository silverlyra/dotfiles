for fzfs in /opt/homebrew/opt/fzf/shell /usr/share/fzf; do
  if [[ -d "$fzfs" ]]; then
    # Auto-completion
    [[ $- == *i* ]] && source "${fzfs}/completion.zsh" 2> /dev/null

    # Key bindings
    source "${fzfs}/key-bindings.zsh"
  fi
done
