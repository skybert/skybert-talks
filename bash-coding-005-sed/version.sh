#! /bin/bash

name=foo

sed "/<plugin>/,/<\/plugin>/ {
  s#<version>(.*)</version>#${name}\1#p
}"
