# sh\_specs

This project is mainly used by me.
Good luck trying to use it. It lacks
documentation.

## Create specs for your other projects:

```sh
  git clone https://github.com/da99/sh_specs.git

  # Write your spec-file.
  # Helpers can be seend in sh_specs/bin/shoulds/*.sh

  sh_specs/bin/sh_specs run-bin  my.specs.sh
  # -- or --
  sh_specs/bin/sh_specs run-dir  my-other-dir
```


Run the specs for `sh_specs` with the following command:

```sh
  cd sh_specs
  bin/sh_specs run-bin
  bin/sh_specs run-dir  my-dir
```

Ignoring Whitespace
=======================

Use `$(echo -n $my string)`

```sh
  should-match "$(echo -n $my_expect)" "$(echo -n $my_actual)"
```
