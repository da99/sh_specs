

# should-pass  "my cmd with args"
# should-pass  my cmd with args
should-pass () {
  local stat
  set +e
  eval "$@"
  stat=$?
  set -e

  if [[ "$stat" -eq "0" ]]; then
    sh_color GREEN  "=== {{Passed}}: $@"
  else
    sh_color RED "=== {{Failed}}: exit $stat: $@"
  fi
}
