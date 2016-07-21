
source "$THIS_DIR/bin/public/run-dir/_.desc.sh"
source "$THIS_DIR/bin/public/run-dir/_.ls-func-files.sh"
source "$THIS_DIR/bin/public/run-dir/_.ls-spec-files.sh"
# === {{CMD}}
ls-with-specs () {

  for FILE in $(ls-func-files); do
    local +x DIR="$(dirname "$FILE")"
    local +x SPECS="$(ls-spec-files "$DIR")"
    if [[ -z "$SPECS" ]]; then
      continue
    fi

    desc "$FILE"
  done

} # === end function
