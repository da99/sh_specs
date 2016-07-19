
# === {{CMD}}  dir
files-without-specs () {
  local +x DIR="$1"; shift
  local +x FILES="$(find "$DIR" -maxdepth 1 -mindepth 1 -type f -name "*.sh" -print)"
  set -x
  test -n "$FILES" && grep --files-without-match --perl-regexp '^\ *should-' $FILES
} # === end function
