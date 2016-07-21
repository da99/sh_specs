
# === {{CMD}}
ls-funcs () {
  find -L "$PWD/bin/" -maxdepth 3 -mindepth 3 -type f -name "_.*" | xargs -I NAME dirname NAME | xargs -I NAME basename NAME | sort
} # === end function
