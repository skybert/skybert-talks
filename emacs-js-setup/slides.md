
## Agenda

- Auto completion
- Code navigation
- Debug JS running in Firefox

---


## Basic JavaScript setup 😉

```lisp
(setq js-indent-level 2)
```

---

## You need Node

```
$ pacman -Sy nodejs
```

---

## You need LSP mode for auto completion++
```lisp
(use-package lsp-mode)
(add-hook 'prog-mode-hook #'lsp)
```

---

## You need DAP mode for debugging

```lisp
(use-package dap-mode
  :config
  (dap-auto-configure-mode)
  
  :bind
  (("<f7>" . dap-step-in)
   ("<f8>" . dap-next)
   ("<f9>" . dap-continue)))
```

---

## Remote debug in Firefox

---

## Remote debug in Firefox

```lisp
(require 'dap-firefox)
```

---

## The easy way

---

## The easy way

```lisp
M-x dap-firefox-setup
```

---


## ...which doesn't work

---

```json
{
  "$id": "1",
  "innerException": null,
  "message": "Request was blocked due to exceeding usage of resource 'Count' in namespace 'AnonymousId'. For more information on why your request was blocked, see the topic \"Rate limits\" on the Microsoft Web site (https://go.microsoft.com/fwlink/?LinkId=823950).",
  "typeName": "Microsoft.TeamFoundation.Framework.Server.RequestBlockedException, Microsoft.TeamFoundation.Framework.Server",
  "typeKey": "RequestBlockedException",
  "errorCode": 0,
  "eventId": 3000
}
```

---

## Manual download

https://marketplace.visualstudio.com/items?itemName=firefox-devtools.vscode-firefox-debug


---

## Where to extract it?

```text
C-h v RET dap-firefox-debug-program RET
```

---


```text
$ mkdir -p ~/.emacs.d/.extension/vscode/\
firefox-devtools.vscode-firefox-debug/

$ unzip ~/tmp/firefox-devtools.vscode-firefox-debug-2.9.8.vsix \
  -d ~/.emacs.d/.extension/vscode/\
firefox-devtools.vscode-firefox-debug/
```

---

## Updating the debugger reference

```lisp
(setq dap-firefox-debug-program
  '("node" "/home/torstein/.emacs.d/.extension/vscode/firefox-devtools.vscode-firefox-debug/extension/dist/adapter.bundle.js"))
```lisp

---

```text
M-x dap-debug
```

---

## That's it!

---

## If firefox doesn't start

```
$ firefox -start-debugger-server &
```

---

## Summary

- lsp-mode
- dap-mode
- vscode-firefox-debug
