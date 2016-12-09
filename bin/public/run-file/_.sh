
# === {{CMD}}  file
# === Useful when combined with `ls-specs`
run-file () {
  local +x SPEC_FILE="$1"; shift
  if [[ ! -f "$SPEC_FILE" ]]; then
    sh_color RED "!!! {{Not a file}}: BOLD{{$SPEC_FILE}}"
    exit 1
  fi

  $THIS_DIR/bin/private/run-file "$SPEC_FILE"
} # === end function
