
# === {{CMD}}  dir
# === Runs files in dir, unless in nested dir or starting with _.:
# === Example:
# ===   - my_dir
# ===     |- _.my.ignored.file.sh
# ===     |- my_spec.sh
# ===     |- my_spec.1.sh
# ===     |- my_spec.2.sh
# ===     |- my_other_dir/
# ===        |- my.ignored.file.sh
run-dir () {
  local +x DIR="$1"; shift
  local +x FOUND=""
  local +x IFS=$'\n'
  echo ""

  for SPEC_FILE in $(find "$DIR" -maxdepth 1 -mindepth 1 -type f -name "*.sh" -and -not -name "_.*" | sort --human-numeric-sort); do
    mksh_setup BOLD -n "{{$(basename "$(dirname "$SPEC_FILE")" )}} "
    mksh_setup BOLD    " /{{$(basename "$SPEC_FILE") }}"
    $THIS_DIR/bin/private/run-file "$SPEC_FILE"
    FOUND="yes"
    echo ""
  done

  if [[ -z "$FOUND" ]]; then
    mksh_setup RED "!!! {{No specs found}}."
    exit 1
  fi


} # === end function
