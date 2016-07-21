
# === {{CMD}}
ls-func-files () {
  find -L "$PWD/bin/" -maxdepth 3 -mindepth 3 -type f -name "_.*" | sort
} # === end function
