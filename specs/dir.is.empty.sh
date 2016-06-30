# === 
# === 
set -u -e -o pipefail


source "$THIS_DIR/specs/lib/reset.sh"

mkdir "$TMP_DIR/specs"

should-exit 1 "sh_specs run $TMP_DIR/specs"
