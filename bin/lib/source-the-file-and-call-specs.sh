
source "$THIS_DIR/bin/lib/source-the-file.sh"

# === {{CMD}}  path/to/file.sh
source-the-file-and-call-specs () {
  source-the-file "$@"
  specs
} # === end function
