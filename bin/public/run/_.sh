

# === {{CMD}}                  # Run all specs in bin/
# === {{CMD}}  My_Perl_RegExp
run() {

  local +x ORIGINAL="$@"
  local +x FOUND=""
  local +x SKIPS=""
  local +x IFS=$'\n'


  if [[ -z "$@" ]]; then
    local +x SEARCH="/bin/"
  else
    local +x SEARCH="$1"; shift
  fi

  for FILE in $(find -L "$PWD/bin/" -maxdepth 3 -mindepth 3 -type f -name "*.sh" -and -not -name "_.*" | grep -P "$SEARCH" | sort); do
    $THIS_DIR/bin/private/run-file "$THIS_DIR" "$FILE"
  done

} # === end func run





