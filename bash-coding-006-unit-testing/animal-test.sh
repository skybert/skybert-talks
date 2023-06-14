#! /usr/bin/env bash

## author: torstein, torstein@skybert.net

setUp() {
  source animal-lib.sh
}

test_get_cat_name() {
  expected=lupus
  actual=$(get_cat_name)
  assertEquals "${expected}" "${actual}"

}

test_is_cat() {
  echo cat | is_cat
  actual=$?

  assertEquals 0 "${actual}"
}

test_is_cat_capitalised() {
  echo Cat | is_cat
  actual=$?

  assertEquals "A Cat is a cat too" 0 "${actual}"
}

test_is_cat_dog() {
  echo dog | is_cat
  actual=$?

  assertEquals 1 "${actual}"
}

main() {
  source ./shunit2/shunit2
}

main "$@"
