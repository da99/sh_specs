
source "$THIS_DIR/bin/private/desc.sh"
# === {{CMD}}
ls-without-specs () {
  for FILE in $(find -L bin/ -maxdepth 3 -mindepth 3 -type f -name "_.sh" | sort ) ; do
    local +x DIR="$(dirname "$FILE")"
    local +x SPECS="$(find "$DIR"/ -mindepth 1 -maxdepth 1 -type f -not -name "_.*" )"
    if [[ -z "$SPECS" ]] || ! grep "should-" "$SPECS" >/dev/null; then
      desc "$FILE"
    fi
  done
} # === end function
