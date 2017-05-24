
# === {{CMD}}
# === Run specs in:
# ===   bin/public/*/specs
# ===   sh/*/specs
run () {
  PATH="$PATH:$THIS_DIR/../sh_color/bin"

  find-specs | while IFS=$'\n' read -r FILE ; do
    { ./"$FILE" &&  sh_color GREEN "=== {{PASSED}}: BOLD{{$FILE}}" ; } || {
      sh_color RED "!!! {{FAILED}}: $? BOLD{{$FILE}}"
    }
  done
} # === end function

find-specs () {
  if [[ -e "bin/public" ]]; then
    find bin/public -mindepth 2 -maxdepth 2 -type f -name "specs"
  fi

  if [[ -e "sh" ]]; then
    find sh/ -mindepth 2 -maxdepth 2 -type f -name "specs"
  fi
} # find-specs ()

