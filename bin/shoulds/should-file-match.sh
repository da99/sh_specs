
# should-file-match  --my-args-to-diff  "Actual.file"  "Expected.file"  "my cmd -w --args"
should-file-match () {
  local +x DIFF_ARGS=""

  while [[ ! -z "$@" && "$1" == --* ]]; do
    DIFF_ARGS=" $1 "
  done

  if [[ -z "$DIFF_ARGS" ]]; then
    DIFF_ARGS="--normal"
  fi

  local +x FILE="$1";    shift
  local +x TARGET_FILE="$1"; shift

  local CMD="[not specified]"

  if [[ ! -z "$@" ]]; then
    local CMD="$1"; shift

    set +e
    eval "$CMD" >/dev/null
    local +x STAT=$?
    set -e
  fi

  if [[ $STAT -ne 0 ]]; then
    sh_color RED "=== Exited {{$STAT}}: BOLD{{$CMD}}"
    exit $STAT
  fi

  if [[ ! -s "$FILE" ]]; then
    sh_color RED "=== File {{not created}}: BOLD{{$FILE}} in command BOLD{{$CMD}}"
    exit 1
  fi


  local +x ACTUAL="$(cat "$FILE")"
  if ! diff $DIFF_ARGS "$FILE" "$TARGET_FILE" ; then
    sh_color RED "=== File does {{not match}}: BOLD{{$FILE}} != BOLD{{$TARGET_FILE}} in command BOLD{{$CMD}}"
    exit 1
  fi

  sh_color GREEN "=== {{PASSED}}: $CMD"
} # === should-create-file-with-content ()

