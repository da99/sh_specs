
# === {{CMD}}  path/to/file.sh
source-the-file () {
  local SPEC_FILE="$@";

  for FUNC_FILE in $(find "$THIS_DIR/bin/lib/funcs/" -maxdepth 1 -mindepth 1 -name "*.sh" -print); do
    source "$FUNC_FILE"
  done

  source "$SPEC_FILE"
} # === end function
