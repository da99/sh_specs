
#  should-match-stderr  "EXPECT"   "my-cmd -with -args"
#  should-match-stderr  "EXPECT"   "ACTUAL"
should-match-stderr () {
  local +x EXPECT="$1"; shift
  local +x CMD="$1"; shift
  local +x STAT
  local +x ACTUAL

  set +e
  ACTUAL="$(eval "$CMD" 2>&1)"
  STAT="$?"
  set -e

  # if [[ "$(echo -E $ACTUAL)" != "$(echo -E $EXPECT)" ]]; then
  if [[ "$ACTUAL" != "$EXPECT" ]]; then
    if [[ -z "$ACTUAL" ]]; then
      ACTUAL="[NULL STRING]"
    fi
    exec >&2
    echo -e -n "!!! MISMATCH: (actual) \"${Red}"; echo -E -n "$ACTUAL";
    echo -e -n "${Color_Off}\"  !=  (expected) \""; echo -E    "$EXPECT\""
    echo       "    CMD: $CMD"
    exit 1
  else
    mksh_setup GREEN "=== {{Passed}}: $(echo -E $CMD)"
  fi
} # === should-match-stderr
