
## Agenda

- Super annoying minibuffer messages
- Jump to source of non-project files
- Decompiler
- [Lombok](https://projectlombok.org/) support
- [eglot-java](https://github.com/yveszoundi/eglot-java)

---

## Get eglot to calm down 

```lisp
(setq eglot-report-progress nil)
```

---

## Lombok and other Java agents

The easiest is to manipulate
[JAVA_TOOL_OPTIONS](https://docs.oracle.com/javase/8/docs/technotes/guides/troubleshoot/envvars002.html).

---

## Lombok and other Java agents

Find the version of [Lombok](https://projectlombok.org/) used in
project:

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

In Emacs, ensure `.envrc` files are loaded when Emacs opens a file
inside a project directory:

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

## Summary

---

## Delve further

- [eglot-java](https://github.com/yveszoundi/eglot-java)
- [JAVA_TOOL_OPTIONS](https://docs.oracle.com/javase/8/docs/technotes/guides/troubleshoot/envvars002.html)
- [Lombok](https://projectlombok.org/)
