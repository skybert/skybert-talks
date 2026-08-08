
# Swift development in Emacs

## LSP

```lisp
(use-package swift-mode
  :ensure t
  :init
  (add-to-list
   'eglot-server-programs
   '(swift-mode . ("/Library/Developer/CommandLineTools/usr/bin/sourcekit-lsp")))

  :hook (swift-mode . subword-mode)
  :hook (swift-mode . (lambda () (eglot-ensure))))
```


## Linting

```text
$ brew install swiftlint
```

