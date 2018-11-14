typeset -gA SHORTCUT_PATHS

shortcut() {
  local spath

  if [[ "$#" -lt 1 ]]; then
    for name in ${(ok)SHORTCUT_PATHS}; do
      spath="${SHORTCUT_PATHS[$name]}"
      echo "$name: ${spath/#$HOME/~}"
    done
    return
  fi

  local name="$1"

  for loc in "${@:2}"; do
    if [[ -d "$loc" ]]; then
      export "${name}=${loc}"
      hash -d "${name}=${loc}"
      SHORTCUT_PATHS[$name]="$loc"
      break
    fi
  done
}

[[ ! -d "${HOME}/src" ]] || shortcut src "${HOME}/src"
[[ ! -d "${HOME}/src/dotfiles" ]] || shortcut dots "${HOME}/src/dotfiles"

# If a command is issued that can’t be executed as a normal command,
# and the command is the name of a directory, perform the cd command to that directory.
setopt AUTO_CD

# Make cd push the old directory onto the directory stack.
setopt AUTO_PUSHD

# Don’t push multiple copies of the same directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS

# Do not print the directory stack after pushd or popd.
setopt PUSHD_SILENT

# Have pushd with no arguments act like ‘pushd ${HOME}’.
setopt PUSHD_TO_HOME

# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation, etc.
# (An initial unquoted ‘~’ always produces named directory expansion.)
setopt EXTENDED_GLOB

# Perform implicit tees or cats when multiple redirections are attempted.
setopt MULTIOS
