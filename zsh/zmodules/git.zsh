# git branch (interactive)
gb() {
  if [[ "$#" -gt 0 ]]; then
    git branch "$@"
    return $?
  fi

  local branches selection branch
  branches=$(git branch --sort=-committerdate -vv) &&
    selection=$(echo "$branches" | fzf --height=20% +m) &&
    branch=$(echo "$selection" | awk '{print $1}' | sed "s/.* //") &&
    if [[ -t 1 ]]; then git checkout "$branch"; else echo $branch; fi
}

# git commit --fixup (interactive)
gcf() {
  local commits selection commit
  commits=$(git log --pretty=format:'%h [%ad] %s' --date=relative master..HEAD) &&
    selection=$(echo "$commits" | fzf --height=20% +m) &&
    commit=$(echo "$selection" | awk '{print $1}') &&
    if [[ -t 1 ]]; then git commit --fixup "$commit"; else echo $commit; fi
}
