
## Agenda

- Why unit test?
- How to make your unit testable?
- Use an xunit library
- Write some unit tests!

---

## Why unit test?

---

## For the same reason 
you do it elsewhere:

- Java
- C#
- C++
- TypeScript
- Python

---

## Don't test in production

- Fewer surprises
- Refactor with greater confidence
- It feels good!

---

## Making your bash code unit testable

---

## Move code into libraries

```text
./bin/foo
./lib/foo-lib.sh
./lib/common-json-lib.sh
./lib/common-http-lib.sh
./test/foo-test.sh
```


---

## shunit2

```text
git clone https://github.com/kward/shunit2.git
```

---

## Let's get unit testing!

---

## Summary

- Better code with unit tests
- Use shunit2

---

## Delve further

- [shunit2](https://github.com/kward/shunit2.git)
- [wikipedia/Unit testing](https://en.wikipedia.org/wiki/Unit_testing)
