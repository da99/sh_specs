
ls-spec-files () {
  local +x DIR="$1"; shift
  local +x RAW="$(find "$DIR"/ -mindepth 1 -maxdepth 1 -type f -not -name "_.*")"
  if [[ -z "$RAW" ]]; then
    return 0
  fi

  grep "should-" "$RAW" --files-with-matches
}
