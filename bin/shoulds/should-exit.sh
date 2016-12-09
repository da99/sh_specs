
should-exit () {
  local +x expect="$1"; shift
  local +x actual
  local +x cmd="$@"

  set +e
  if [[ "$expect" -ne 0 ]]; then
    eval "$@" 2>/dev/null
  else
    eval "$@"
  fi
  actual="$?"
  set -e

  if [[ "$expect" -eq "$actual" ]]; then
    sh_color GREEN  "=== {{Passed}}: exit $expect: $cmd"
  else
    sh_color RED "=== Spec wanted status $expect but got {{$actual}}"
  fi
}

