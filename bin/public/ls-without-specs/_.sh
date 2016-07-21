
source "$THIS_DIR/bin/public/run-dir/_.desc.sh"
source "$THIS_DIR/bin/public/run-dir/_.ls-func-files.sh"
source "$THIS_DIR/bin/public/run-dir/_.ls-spec-files.sh"
# === {{CMD}}
ls-without-specs () {
  for FILE in $(ls-func-files) ; do
    local +x DIR="$(dirname "$FILE")"
    local +x SPECS="$(ls-spec-files "$DIR")"
    if [[ -z "$SPECS" ]] || ! grep "should-" "$SPECS" --max-count 1 >/dev/null; then
      desc "$FILE"
    fi
  done
} # === end function
