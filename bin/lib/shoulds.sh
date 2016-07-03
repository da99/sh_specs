
# === {{CMD}}
shoulds () {
  find "$THIS_DIR/bin/lib/funcs" -type f -name "should-*.sh" | sort | xargs -I FILE basename FILE .sh
} # === end function
