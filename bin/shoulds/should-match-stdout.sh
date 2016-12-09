

#  should-match-stdout  "EXPECT"   "my-cmd -with -args"
#  should-match-stdout  "EXPECT"   "ACTUAL"
should-match-stdout () {
  local +x EXPECT="$1"; shift
  local +x CMD="$1"; shift
  local +x STAT
  local +x ACTUAL

  set +e
  ACTUAL="$(eval "$CMD")"
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
    sh_color GREEN "=== {{Passed}}: $(echo -E $CMD)"
  fi
} # === should-match-stdout
