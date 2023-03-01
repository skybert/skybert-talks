#! /bin/sed -rnf

/<plugin>/,/<\/plugin>/ {
  s#[ ]+<version>(.*)</version>#\1#p
}
