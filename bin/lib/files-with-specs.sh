
# === {{CMD}}  dir
# === {{CMD}}  dir  search_string
files-with-specs () {
  local +x DIR="$1"; shift
  local +x SEARCH="*.sh";

  if [[ ! -z "$@" ]]; then
    SEARCH="$@"
  fi

  local +x FILES="$(find "$DIR" -maxdepth 1 -mindepth 1 -type f -name "$SEARCH" -print)"
  test -n "$FILES" && grep --files-with-matches --perl-regexp '^\ *should-' $FILES | sort || :
} # === end function
