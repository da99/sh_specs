
source "$THIS_DIR/bin/private/desc.sh"
# === {{CMD}}
ls-with-specs () {

  for FILE in $(find -L "$PWD/bin/" -maxdepth 3 -mindepth 3 -type f -name "_.sh"); do
    local +x DIR="$(dirname "$FILE")"
    local +x SPECS="$(find "$DIR"/ -mindepth 1 -maxdepth 1 -type f -not -name "_.*" )"
    if [[ -z "$SPECS" ]] || ! grep "should-" "$SPECS" >/dev/null; then
      continue
    fi

    desc "$FILE"
  done

} # === end function
