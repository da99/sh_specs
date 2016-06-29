

# === {{CMD}}                       # Run all specs in bin/lib
# === {{CMD}}  path/to/filename.sh  other args
# === {{CMD}}  filename.sh          other args
# === {{CMD}}  file*                other args
run-specs () {

  if [[ -z "$@" ]]; then
    for FILE in $(grep -r -l -P '^specs\s*\(\)' bin/lib); do
      mksh_setup BOLD "=== Specs: {{$FILE}}"
      $0 run-specs "$FILE"
      echo ""
    done

    files="$(grep -r -L -P '^specs\s*\(\)' bin/lib | grep -P '.sh$' || :)"
    if [[ -n "$files" ]]; then
      mksh_setup ORANGE "=== Files {{without}} specs:"
      echo -e "$files"
      echo ""
    fi

    mksh_setup GREEN "==== All specs {{passed}}."
    return 0
  fi

  local FILE_ARG="$1"; shift

  if [[ -f "$FILE_ARG" ]]; then
    local +x FILE="$FILE_ARG"
    local +x THIS_DIR="$PWD"
    source "$FILE"
    # NOTE: We can't use 'specs || report-fail'
    #  because of this:
    #  http://stackoverflow.com/questions/4072984/set-e-in-a-function
    trap 'report-fail $?' EXIT
    specs "$@"
    trap - EXIT
    exit 0
  fi

  FILES="$(find bin/lib -type f -name "$FILE_ARG" -print)"

  if [[ -z "$FILES" ]]; then
    mksh_setup RED "!!! Files {{not found}}: BOLD{{$FILE_ARG}}"
    exit 1
  fi

  local +x IFS=$'\n'
  for FILE in $FILES; do
    if [[ ! -s "$FILE" ]]; then
      mksh_setup RED "!!! File not found: {{$FILE_ARG}}"
      exit 0
    fi

    $0 run-specs "$FILE" "$@"
  done
}





