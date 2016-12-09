
should-create-file-with-content () {
  local +x FILE="$1";    shift
  local +x CONTENT="$1"; shift
  local +x CMD="$1";     shift

  set +e
  eval "$CMD" >/dev/null
  local +x STAT=$?
  set -e

  if [[ $STAT -ne 0 ]]; then
    sh_color RED "=== Exited {{$STAT}}: BOLD{{$CMD}}"
    exit $STAT
  fi

  if [[ ! -e "$FILE" ]]; then
    sh_color RED "=== File {{not created}}: BOLD{{$FILE}} in command BOLD{{$CMD}}"
    exit 1
  fi

  local +x ACTUAL="$(cat "$FILE")"
  if [[ "$ACTUAL" != "$CONTENT" ]]; then
    sh_color RED "=== File does {{not match}}: BOLD{{$FILE}} in command BOLD{{$CMD}}"
    sh_color RED "{{$ACTUAL}} != BOLD{{$CONTENT}}"
    exit 1
  fi

  sh_color GREEN "=== {{PASSED}}: $CMD"
} # === should-create-file-with-content ()

