
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

## Foo.java is a non-project file, only syntax errors are reported

---

## Plugin execution not covered by lifecycle configuration

```text
Plugin execution not covered by lifecycle configuration:
net.revelc.code:formatter-maven-plugin:0.5.2:format (execution:
default, phase: process-sources)
```


---

## compilationUnit is null

```text
$ ps auxww | grep jdtls
..
$ tail -F /tmp/jdtls-753c5f82ed24fe592aca1c8653f484a5254687b4/.metadata/.log

!ENTRY org.eclipse.jdt.core 4 0 2024-12-23 14:38:29.303
!MESSAGE Lombok annotation handler class lombok.eclipse.handlers.HandleConstructor$HandleAllArgsConstructor failed
!STACK 0
java.lang.NullPointerException: Cannot invoke "Object.getClass()" because "compilationUnit" is null
	at lombok.eclipse.handlers.EclipseHandlerUtil.setDocComment(EclipseHandlerUtil.java:2841)
	at lombok.eclipse.handlers.EclipseHandlerUtil.setDocComment(EclipseHandlerUtil.java:2830)
	at lombok.eclipse.handlers.HandleConstructor.generateConstructorJavadoc(HandleConstructor.java:609)
	at lombok.eclipse.handlers.HandleConstructor.generate(HandleConstructor.java:290)
	at lombok.eclipse.handlers.HandleConstructor.generateConstructor(HandleConstructor.java:246)
	at lombok.eclipse.handlers.HandleConstructor$HandleAllArgsConstructor.handle(HandleConstructor.java:165)
	at lombok.eclipse.HandlerLibrary$AnnotationHandlerContainer.handle(HandlerLibrary.java:106)
	at lombok.eclipse.HandlerLibrary.handleAnnotation(HandlerLibrary.java:237)
	at lombok.eclipse.TransformEclipseAST$AnnotationVisitor.visitAnnotationOnType(TransformEclipseAST.java:269)
	at lombok.eclipse.EclipseNode.traverse(EclipseNode.java:107)
	at lombok.eclipse.EclipseAST.traverseChildren(EclipseAST.java:231)
	at lombok.eclipse.EclipseNode.traverse(EclipseNode.java:74)
	at lombok.eclipse.EclipseAST.traverseChildren(EclipseAST.java:231)
	at lombok.eclipse.EclipseNode.traverse(EclipseNode.java:69)
	at lombok.eclipse.EclipseAST.traverse(EclipseAST.java:224)
	at lombok.eclipse.TransformEclipseAST.go(TransformEclipseAST.java:226)
	at lombok.eclipse.TransformEclipseAST.transform(TransformEclipseAST.java:187)
	at lombok.eclipse.TransformEclipseAST.transform_swapped(TransformEclipseAST.java:104)
```


--


--


Reported in https://github.com/projectlombok/lombok/issues/3706 and
fixed in `1.18.36`.


---

---


## not on its project's build path

> Java Model Exception: Error in Java Model (code 1006): <project
> root> [in com.foo.logging-logging] is not on its project's build
> path

```diff
-                  <outputDirectory>${project.build.directory}/generated-test-sources</outputDirectory>
+                  <outputDirectory>src/test/java</outputDirectory>

```



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

## flymake reporting is slow

```lisp
    538,236,346  68% - timer-event-handler
    538,229,922  68%  - apply
    537,867,476  68%   - #<compiled -0x13c0f7931c03005f>
    537,866,909  68%    - jsonrpc-connection-receive
    537,384,875  68%     - #<compiled -0xa311166a4610761>
    537,384,875  68%      - apply
    537,384,875  68%       - eglot-handle-notification
    537,384,875  68%        - apply
    537,384,875  68%         - #<compiled 0x1c4f7678560ae74>
    537,249,968  68%          - eglot--report-to-flymake
    537,249,968  68%           - #<compiled -0xd63a09ad50aae4c>
    537,249,968  68%            - apply
    537,249,968  68%             - flymake--handle-report
    537,249,968  68%              - apply
    537,244,261  68%               - #<subr flymake--handle-report>
    537,231,321  68%                - flymake--update-diagnostics-listings
    537,165,849  68%                 - revert-buffer
    537,165,849  68%                  - tabulated-list-revert
    537,135,225  68%                   - tabulated-list-print
    269,949,056  34%                    - tabulated-list-print-entry
     61,124,251   7%                     + tabulated-list-print-col
    210,888,264  26%                    + flymake--project-diagnostics-entries
         22,247   0%                    + flymake--diagnostics-buffer-entries
         65,472   0%                 + project-buffers
         10,580   0%                  flymake--log-1
          1,520   0%                + flymake--publish-diagnostics
         90,664   0%          + eglot--uri-to-path
         42,968   0%          + find-buffer-visiting
          1,275   0%            #<compiled -0x1317490df61fe95d>
        285,274   0%     + jsonrpc--continue
        196,760   0%     + apply
        191,223   0%   + #<subr F616e6f6e796d6f75732d6c616d626461_anonymous_lambda_12>

```


---

## Summary

---

## Delve further

- [eglot-java](https://github.com/yveszoundi/eglot-java)
- [JAVA_TOOL_OPTIONS](https://docs.oracle.com/javase/8/docs/technotes/guides/troubleshoot/envvars002.html)
- [Lombok](https://projectlombok.org/)
