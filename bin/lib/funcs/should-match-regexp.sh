
# should-match-regexp  "my regexp"  "my cmd -with -args"
should-match-regexp () {
  local EXPECT="$1"; shift
  local CMD="$1"; shift
  local STAT
  local ACTUAL

  set +e
  ACTUAL="$(eval "$CMD")"
  STAT="$?"
  set -e

  if echo "$ACTUAL" | grep -P "$EXPECT"; then
    mksh_setup GREEN "=== {{Passed}}: $CMD"
  else
    mksh_setup RED "=== EXPECTED: {{$ACTUAL}}  =~  BOLD{{$EXPECT}}"
    exit 1
  fi
} # === should-match-regexp ()
