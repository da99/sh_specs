

source "$THIS_FUNC_DIR/_.desc.sh"
source "$THIS_FUNC_DIR/_.ls-func-files.sh"
source "$THIS_FUNC_DIR/_.ls-spec-files.sh"

# === {{CMD}}                  # Run all specs in bin/
# === {{CMD}}  My_Perl_RegExp
# === Runs specs in: bin/public, bin/private, bin/dir, ...
# === Ignores any files with names starting with: _.
run-bin() {

  echo ""
  local +x ORIGINAL="$@"
  local +x FOUND=""
  local +x IFS=$'\n'

  if [[ -z "$@" ]]; then
    local +x SEARCH="/bin/"
  else
    local +x SEARCH="$1"; shift
  fi

  for FILE in $(ls-func-files | grep -P "$SEARCH"); do
    local +x DIR="$(dirname "$FILE")"
    for SPEC_FILE in $(ls-spec-files "$DIR"); do
      sh_color BOLD -n "{{$(basename "$(dirname "$FILE")" )}} "
      sh_color BOLD -n "({{$(basename "$(dirname "$(dirname "$FILE")" )" )}})"
      sh_color BOLD    " /{{$(basename "$SPEC_FILE") }}"
      $THIS_DIR/bin/private/run-file "$SPEC_FILE"
      FOUND="yes"
      echo ""
    done
  done

  if [[ -z "$FOUND" ]]; then
    sh_color RED "!!! {{No specs found}}."
    exit 1
  fi


} # === end func





