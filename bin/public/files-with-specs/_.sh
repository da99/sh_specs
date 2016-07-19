
# === {{CMD}}  dir  file  file  dir ...
files-with-specs () {
  local +x SEARCH="*.sh";
  local +x PATTERN='^\ *should-'

  while [[ ! -z "$@" ]]; do
    local +x TARGET="$1"; shift
    if [[ -d "$TARGET" ]]; then
      local +x DIR="$TARGET"
      local +x FILES="$(find "$DIR" -maxdepth 1 -mindepth 1 -type f -name "$SEARCH" -print)"
      test -n "$FILES" && grep --files-with-matches --perl-regexp "$PATTERN" $FILES | sort || :
      continue
    fi

    if [[ -f "$TARGET" ]]; then
      local +x FILE="$TARGET"
      grep --files-with-matches --perl-regexp "$PATTERN" "$FILE" || :
      continue
    fi
  done # === while $@
} # === end function
