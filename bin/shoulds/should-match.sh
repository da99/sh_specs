
#  should-match  "EXPECT"   "my-cmd -with -args"
#  should-match  "EXPECT"   "ACTUAL"
#  should-match  "EXPECT"   "ACTUAL"    "description of operation"
should-match () {
  local +x EXPECT="$1"; shift
  local +x CMD="$1"; shift
  local +x STAT
  local +x ACTUAL

  local +x DESC="$CMD"

  if [[ ! -z "$@" ]]; then
    DESC="$1"; shift
  fi

  local +x CMD_FILE="$(echo $CMD | grep -Po "([^[:space:]]+)" | head -n 1)"

  if [[ "$CMD" == "$EXPECT" ]] || ! which "$CMD_FILE" >/dev/null 2>&1; then
    ACTUAL="$CMD"
  else
    set +e
    ACTUAL="$(eval "$CMD")"
    STAT="$?"
    set -e
  fi

  if [[ "$ACTUAL" != "$EXPECT" ]]; then
    if [[ -z "$ACTUAL" ]]; then
      ACTUAL="[NULL STRING]"
    fi
    exec >&2
    echo -e -n "=== MISMATCH: (actual) \"${Red}"; echo -E -n "$ACTUAL";
    echo -e -n "${Color_Off}\"  != (expect) \""; echo -E    "$EXPECT\"";
    exit 1
  else
    sh_color GREEN "-n" "=== {{Passed}}: "; echo -E "$DESC"
  fi
} # === should-match
