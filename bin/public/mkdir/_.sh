
# === {{CMD}}
# === {{CMD}}  my/new/path
# === Deletes and re-creates a dir in /tmp
mkdir () {
  unset -f mkdir
  local +x NAME="$(basename "$(realpath "$0")")"
  if [[ ! -z "$@" ]]; then
    NAME="$NAME/$@"
  fi

  local +x DIR="/tmp/sh_specs/$NAME"

  rm -rf "$DIR"
  mkdir -p "$DIR"
  echo "$DIR"
} # === end function
