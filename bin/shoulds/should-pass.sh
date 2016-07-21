

# should-pass  "my cmd with args"
# should-pass  my cmd with args
should-pass () {
  local stat
  set +e
  eval "$@"
  stat=$?
  set -e

  if [[ "$stat" -eq "0" ]]; then
    bash_setup GREEN  "=== {{Passed}}: $@"
  else
    bash_setup RED "=== {{Failed}}: exit $stat: $@"
  fi
}
