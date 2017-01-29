
# === {{CMD}}  "func-name"  "name-of-spec"
# === {{CMD}}  "func-name"  "name-of-spec"  input output
new-spec-dir () {
  local +x FUNC_DIR="$1"; shift
  local +x SPEC_NAME="$1"; shift

  local +x IFS=$'\n'
  for DIR in $(echo "bin/public/$FUNC_DIR"; echo "bin/$FUNC_DIR"; echo "$FUNC_DIR"); do
    if [[ -d "$DIR" ]]; then
      FUNC_DIR="$DIR"
      break
    fi
  done

  if [[ ! -d "$FUNC_DIR" ]]; then
    echo "!!! Function not found: $FUNC_DIR" >&2
  fi

  echo "=== in: $FUNC_DIR" >&2

  local +x NEW_DIR="$FUNC_DIR/specs/$SPEC_NAME"
  if [[ -d "$NEW_DIR" ]]; then
    echo "=== Already exists: $NEW_DIR" >&2
  else
    echo "=== Creating: $NEW_DIR" >&2
    mkdir -p "$FUNC_DIR/specs/$SPEC_NAME"
  fi

  local +x CMD_SH="$NEW_DIR/cmd.sh"
  if [[ -e "$CMD_SH" ]]; then
    echo "=== Already exists: $CMD_SH"
  else
    echo "=== Creating: $CMD_SH" >&2
    touch "$CMD_SH"
  fi

  chmod +x "$NEW_DIR/cmd.sh"
} # === end function
