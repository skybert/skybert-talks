(add-to-list 'load-path "/usr/local/src/c3po.el")
(require 'c3po)
(setq c3po-api-key "sk-234asefasdf234fse")

(add-to-list 'load-path "/usr/local/src/copilot.el")
(require 'editorconfig)
(require 'copilot)

(add-hook 'prog-mode-hook 'copilot-mode)

(with-eval-after-load 'company
  ;; disable inline previews
  (delq 'company-preview-if-just-one-frontend company-frontends))
  
(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)

