# sh\_specs


Run the specs for `sh_specs` with the following command:

```sh
  cd sh_specs
  bin/sh_specs run specs
```

Ignoring Whitespace
=======================

Use `$(echo -n $my string)`

```sh
  should-match "$(echo -n $my_expect)" "$(echo -n $my_actual)"
```
