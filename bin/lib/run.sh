
source "$THIS_DIR"/bin/lib/files-with-specs.sh

# === {{CMD}}                       # Run all specs in bin/lib
# === {{CMD}}  dir/sub1/sub2        # Run all specs in specified dir.
# === {{CMD}}  path/to/filename.sh  other args
# === {{CMD}}  filename.sh          other args
# === {{CMD}}  file*                other args
run() {

  local +x DIR=""
  local +x FILE=""
  local +x SEARCH_STRING=""
  local +x IFS=$'\n'

  # === SET THE VALUES:
  if [[ -z "$@" ]]; then
    DIR="bin/lib"
  fi

  if [[ ! -z "$@" ]]; then
    if [[ -d "$1" ]]; then
      DIR="$1"; shift
    else
      if [[ -f "$1" ]]; then
        FILE="$1"; shift
      else
        SEARCH_STRING="$1"; shift
      fi # === if file
    fi # === if -d "$1"
  fi # === if ! -z "$@"


  # === IF is file: ==============================================================
  if [[ ! -z "$FILE" ]]; then
    $0 run-file "$FILE" "$@"
    mksh_setup GREEN "==== All specs {{passed}} in file: BOLD{{$FILE}}"
    return 0
  fi # === if file


  # === IF is dir: ===============================================================
  if [[ ! -z "$DIR" ]]; then
    local +x FILES="$(files-with-specs "$DIR")"
    for FILE in $FILES; do
      mksh_setup BOLD "=== Specs: {{$FILE}}"
      $0 run-file "$FILE"
      echo ""
    done

    if [[ -z "$FILES" ]]; then
      mksh_setup RED "=== No files {{found}} in dir: BOLD{{$DIR}}"
      exit 1
    fi

    mksh_setup GREEN "=== All specs {{passed}} in dir: BOLD{{$DIR}}"
    return 0
  fi # === if dir


  # === IF is search string: =======================================================
  if [[ ! -z "$SEARCH_STRING" ]]; then
    local +x DIR="$(dirname "$SEARCH_STRING")"
    local +x NAME="$(basename "$SEARCH_STRING")"
    local +x FOUND=""
    local +x FILES="$(files-with-specs "$DIR" "$NAME")"
    for SPEC_FILE in $FILES; do
      $0 run-file "$SPEC_FILE" "$@"
      echo ""
    done

    if [[ -z "$FILES" ]]; then
      mksh_setup RED "!!! Files {{not found}}: BOLD{{$SEARCH_STRING}}"
      exit 1
    fi

    mksh_setup GREEN "==== All specs {{passed}} in BOLD{{$SEARCH_STRING}}"
  fi # === if SEARCH_STRING


} # === end func run





