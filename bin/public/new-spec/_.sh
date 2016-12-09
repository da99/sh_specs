
# === {{CMD}}  file-name
# === {{CMD}}  path/to/file-name
# === Adds ".sh" to file-name and creates file.
new-spec () {
  local +x FILE="$1"; shift
  local +x FILE_NAME="${FILE}.sh"
  touch "$FILE_NAME"
  echo "# === "                >> "$FILE_NAME"
  echo "# === "                >> "$FILE_NAME"
  echo "set -u -e -o pipefail" >> "$FILE_NAME"
  chmod +x "$FILE_NAME"
  sh_color BOLD "=== Created: {{$FILE_NAME}}"
} # === end function
