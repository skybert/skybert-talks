
## Agenda

My favourite `sed` tricks

---

## Search and replace

---

## Search and replace - one

```text
$ echo orange orange orange | sed s/orange/apple/
```

---

## Search and replace - all

```text
$ echo orange orange orange | sed s/orange/apple/g
```

---

## Search (no replace)

---

## Search (no replace)

> grep = g/re/p

---

## Search (no replace)

```text
$ cat pom.xml | sed -n /important/p
$ cat pom.xml | sed -n /important/Ip
```

---

## More advanced search and replace

```text
$ cat pom.xml | sed -rn 's#<artifactId>(.*)</artifactId>#\1#p'
```

---

## Even more advanced search and replace

Working on blocks of text

---

## Even more advanced search and replace

```perl
cat pom.xml | sed -nr '/<plugin>/,/<\/plugin>/{
  s#<version>(.*)</version>#\1#p
}'
```

---

## If your sed starts growing

```bash
#! /bin/sed -rnf
```

---

```text
$ cat pom.xml | ./version.sed
```

---

## Summary

- Search and replace
- Great for searching too 
- Line based
- Can work on blocks too

---

## Delve further

- [GNU sed manual](https://www.gnu.org/software/sed/manual/sed.html)
- [Handy one liners](https://edoras.sdsu.edu/doc/sed-oneliners.html)
