
# === {{CMD}}  DIR
# === List all .sh files that don't start with: '_."
ls-specs () {
  local +x DIR="$1"; shift
  find "$DIR" -maxdepth 1 -mindepth 1 -type f -name "*.sh" -and -not -name "_.*"
} # === end function
