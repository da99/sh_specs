

report-fail () {
  stat=$1; shift
  if [[ "$stat" -ne "0" ]]; then
    sh_color RED "=== Spec {{Failed}} with exit status: $stat"
  fi
  exit $stat
}

