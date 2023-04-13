
## Agenda

- OpenAI & ChatGPT in Emacs
- Copilot in Emacs

---

## OpenAI & ChatGPT

- [OpenAI.com](openai.com): company + underlying tech
- ChatGPT: chat bot using OpenAI

---

## ChatGPT in Emacs

I've tested:

- gptel
- c3po
- CodeGPT

---

## c3po.el 🤖

```lisp
(add-to-list 'load-path "/usr/local/src/c3po.el")
(require 'c3po)
(setq c3po-api-key "sk-234asefasdf234fse")
```

---

## c3po.el 🤖

> How to create a java program that gets a value from a redis server
> and follows redirects to other nodes in a redis cluster

---

## c3po.el 🤖

- `M-x c3po-dev-chat`
- `M-x c3po-explain-code`
- `M-x c3po-correct-grammar` (`-and-replace`)

---

## copilot.el 🤖

```lisp
(add-to-list 'load-path "/usr/local/src/copilot.el")
(require 'editorconfig)
(require 'copilot)
```

---

## copilot.el 🤖

- Sign up for copilot on [github.com](github.com)
- Then, use `M-x copilot-login` 
- In the browser, paste in the one time code Emacs has put on the clipboard 📋

---

## copilot.el 🤖

```lisp
(add-hook 'prog-mode-hook 'copilot-mode)
```

---

## copilot.el 🤖

```lisp
(with-eval-after-load 'company
  ;; disable inline previews
  (delq 'company-preview-if-just-one-frontend company-frontends))
  
(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
```

---

## copilot.el 🤖

```
M-x copilot-mode
```

---

## Summary

- Research assistant: [c3po.el](https://github.com/d1egoaz/c3po.el)
- Pair programming buddy: [copilot.el](https://github.com/zerolfx/copilot.el)

---

## Delve further

- [openai.com](openai.com)
- [github.com/copilot](https://github.com/features/copilot)
- [c3po.el](https://github.com/d1egoaz/c3po.el)
- [copilot.el](https://github.com/zerolfx/copilot.el)
