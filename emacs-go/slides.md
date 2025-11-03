
## Agenda

---

## go-mode

```text
M-x package-install RET go-mode RET
```

---

## gopls

`gopls` - "Go please!"

To install the official Go language server, I did:

```text
# pacman -S gopls
```
a
---

## eglot

```text
M-x eglot RET
```

---

## Debugger

I researched a bit, and it seemed from colleagues and Reddit
discussions, that [Delve](https://github.com/go-delve/delve) is
currently the best one, so I searched for that:

```text
$ paru -Ss delve go
extra/delve 1.24.1-1 [0 B 15.11 MiB] [Installed]
    A debugger for the Go programming language.
```

```text
# paru -S extra/delve
```

---

## Debugger

```text
M-x package-install RET dape RET
```

---

## Debugger

```lisp
(setq dape-buffer-window-arrangement 'right)
```

---

## Running tests

```lisp
M-x package-install RET gotest RET
```

---

## Summary

---

## Delve further
