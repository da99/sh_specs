
# === {{CMD}}  EXPECTED  my cmd with args
should-be () {
  local +x EXPECTED="$1"; shift
  local +x CMD="$@"

  local +x ACTUAL="$($CMD 2>&1)"

  if [[ "$EXPECTED" != "$ACTUAL" ]]; then
    sh_color RED "BOLD{{$EXPECTED}} != RED{{$ACTUAL}}"
    sh_color RED "Command: BOLD{{$CMD}}"
    exit 1
  fi
} # === end function
