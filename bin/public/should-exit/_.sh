
# === {{CMD}}  NUM  my cmd with args
should-exit () {
  local +x EXPECTED="$1"; shift
  local +x CMD="$@"

  local +x ACTUAL="0"
  $@ || ACTUAL="$?"

  if [[ "$ACTUAL" != "$EXPECTED" ]]; then
    sh_color RED "Exited: {{$ACTUAL}} but expected {{$EXPECTED}}"
    sh_color RED "CMD:    $CMD"
    exit 2
  fi
} # === end function
