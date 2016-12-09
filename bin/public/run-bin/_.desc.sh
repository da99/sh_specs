
# === {{CMD}}  FILE
desc () {
  local +x FILE="$1"; shift
  local BASE="$(basename "$FILE")"
  if [[ "$BASE" != "_.sh" ]]; then
    sh_color RED "!!! Can't describe: {{$FILE}}"
    exit 1
  fi

  local +x NAME="$(basename "$(dirname "$FILE")" )"
  local +x CATEGORY="$(basename "$(dirname "$(dirname "$FILE")" )" )"
  if [[ "$CATEGORY"  != "public" ]]; then
    sh_color BOLD "$NAME ({{$CATEGORY}})"
  else
    echo "$NAME"
  fi
} # === end function
