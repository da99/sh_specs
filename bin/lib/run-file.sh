
# === {{CMD}}  path/to/file.sh
# === {{CMD}}  path/to/file.sh  optional args
run-file () {

  local +x TEMP_PREFIX="/tmp/sh_specs.temp.$$"
  local +x FILE="$1"; shift
  export IS_SPEC_RUN="YES"

  # === Figure out if specs is defined.
  # === We can't simply "source" the file because the file would most likely
  # ===   have dependecnies relative to it's original location. In other words,
  # ===   it would have unknown behaviour.
  local +x SPEC_LINE="$(grep -n -m 1 --perl-regexp "^\ *specs\ +\(" "$FILE" | cut -d: -f1 || :)"
  local +x CODE=""
  if [[ ! -z "$SPEC_LINE" ]]; then
    CODE="$(tail -n +${SPEC_LINE} "$FILE")"
  fi

  if [[  ! -f  "$FILE" ]]; then
    mksh_setup RED "=== Spec file {{not found}}: BOLD{{$FILE}}"
    exit 1
  fi

  for FUNC_FILE in $(find "$THIS_DIR/bin/lib/funcs/" -maxdepth 1 -mindepth 1 -name "*.sh" -print); do
    source "$FUNC_FILE"
  done

  # NOTE: We can't use 'specs || report-fail'
  #  because of this:
  #  http://stackoverflow.com/questions/4072984/set-e-in-a-function
  trap 'report-fail $?' EXIT

  if [[ -z "$CODE" ]]; then
    source "$FILE"
  else
    local +x TMP="$(mktemp "$TEMP_PREFIX".XXXXXXXXXXXXXXXXXX)"
    echo "$CODE" > $TMP
    source "$TMP"
    specs
  fi

  rm -f "$TEMP_PREFIX".*
  trap - EXIT
} # === end function

