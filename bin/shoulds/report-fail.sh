

report-fail () {
  stat=$1; shift
  if [[ "$stat" -ne "0" ]]; then
    mksh_setup RED "=== Spec {{Failed}} with exit status: $stat"
  fi
  exit $stat
}

