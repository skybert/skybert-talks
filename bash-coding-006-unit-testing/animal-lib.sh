# -*- mode: sh; sh-shell: bash; -*-

is_cat() {
  grep -q --ignore-case cat
}

get_cat_name() {
  echo lupus
}
