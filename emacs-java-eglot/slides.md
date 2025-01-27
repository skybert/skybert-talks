
## Agenda

- Use [Eglot](https://github.com/joaotavora/eglot) for Java
  development
- Run JUnit tests
- [Lombok](https://projectlombok.org/) support (agents)
- Decompiler

---

## Get eglot to calm down

```lisp
(setq eglot-report-progress nil)
```

---

## Lombok and other Java agents

---

## Lombok and other Java agents

The easiest is to manipulate
[JAVA_TOOL_OPTIONS](https://docs.oracle.com/javase/8/docs/technotes/guides/troubleshoot/envvars002.html)

---

## Lombok and other Java agents

Find the version of [Lombok](https://projectlombok.org/) used in
project:

---

## Lombok and other Java agents

```bash
$ cd /path/to/src
$ mvn dependency:list |
      grep 'module lombok' |
      awk '{print $2}' |
      cut -d: -f2,4 |
      tr ':' '-' |
      sed -r 's#(.*)#\1.jar#' |
      xargs find ~/.m2/repository/ -name
/home/torstein/.m2/repository/org/projectlombok/lombok/1.18.34/lombok-1.18.34.jar
```

---

## Lombok and other Java agents

Now, add this lombok JAR as a Java agent to this project's runtime
environment:

```text
$ cd /path/to/src
$ direnv allow .
$ echo >> .envrc <<EOF
export JAVA_TOOL_OPTIONS=/home/torstein/.m2/repository/org/projectlombok/lombok/1.18.34/lombok-1.18.34.jar
EOF
```

---

## Lombok and other Java agents

```lisp
(use-package envrc
  :ensure t
  :init
  (envrc-global-mode))
```

---

## Lombok and other Java agents

That's it. When loading eglot, it should set the `JAVA_TOOL_OPTIONS`
Unix env variable and load Lombok as a Java agent.

---

## eldoc

---

## eldoc-box

---

## Show error and warning overview

```text
M-x flymake-show-buffer-diagnostics
```

---

## Show error and warning overview

```text
M-x flymake-show-project-diagnostics
```

---

## Summary

- eglot works great with java projects
- still behind lsp-mode
- [direnv](https://github.com/wbolster/emacs-direnv) and `.envrc` are great
- eldoc rocks
- [eldoc-box-hover-at-point-mode](https://github.com/casouri/eldoc-box) makes it even better

---

## Delve further

- [JAVA_TOOL_OPTIONS](https://docs.oracle.com/javase/8/docs/technotes/guides/troubleshoot/envvars002.html)
- [Lombok](https://projectlombok.org/)
- [eldoc-box-hover-at-point-mode](https://github.com/casouri/eldoc-box) 
- [eldoc](https://www.gnu.org/software/emacs/manual/html_node/emacs/Programming-Language-Doc.html)
