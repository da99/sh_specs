
# === {{CMD}}
shoulds () {
  find "$THIS_DIR/bin/public" -type f -name "should-*.sh" | sort | xargs -I FILE basename FILE .sh
} # === end function
