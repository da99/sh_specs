
source "$THIS_DIR"/bin/lib/files-with-specs.sh

# === {{CMD}}                       # Run all specs in bin/lib
# === {{CMD}}  dir/sub1/sub2        # Run all specs in specified dir.
# === {{CMD}}  path/to/filename.sh  dir/ file/glob/*   other-file  etc...
run() {

  if [[ -z "$@" ]]; then
    $0 run bin/lib
    return 0
  fi

  local +x ORIGINAL="$@"
  local +x FOUND=""
  local +x SKIPS=""
  local +x IFS=$'\n'

  while [[ ! -z "$@" ]]; do

    local +x TARGET="$1"; shift

    # === IF is file: ==============================================================
    if [[ -f "$TARGET" && ! -z "$(files-with-specs "$TARGET")" ]]; then
      local +x FILE="$TARGET"
      $THIS_DIR/bin/lib/private/run-file "$THIS_DIR" "$FILE"
      continue
    fi

    # === IF is directory: =========================================================
    if [[ -d "$TARGET" ]]; then
      local +x DIR="$TARGET"
      local +x FILES="$(files-with-specs "$DIR")"
      for FILE in $FILES; do
        mksh_setup BOLD "=== Specs: {{$FILE}}"
        $THIS_DIR/bin/lib/private/run-file "$THIS_DIR" "$FILE"
        echo ""
      done

      if [[ -z "$FILES" ]]; then
        mksh_setup RED "=== No files {{found}} in dir: BOLD{{$DIR}}"
        exit 1
      fi

      continue
    fi # === if directory

    SKIPS="$SKIPS\nBOLD{{$TARGET}}"
  done # === while $@

  mksh_setup GREEN "==== All specs {{passed}} in: BOLD{{$ORIGINAL}}"
  if [[ ! -z "$SKIPS" ]]; then
    mksh_setup ORANGE "=== {{Skipped}}: $SKIPS"
  fi
} # === end func run





