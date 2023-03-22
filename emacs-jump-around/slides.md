
## Agenda

- Pretty good jump to source
- Without TAGS
- Without LSP

---

```lisp
(use-package dumb-jump
   :init
   (setq xref-show-definitions-function #'xref-show-definitions-completing-read)

   :config
   (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))
```


---

## Summary

- `dumb-jump` is pretty good
- Depends on language

---

## Delve further

- https://github.com/jacktasia/dumb-jump
