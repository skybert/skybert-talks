(condition-case nil
    (require 'use-package)
  (file-error
   (require 'package)
   (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
   (package-initialize)
   (package-refresh-contents)
   (package-install 'use-package)
   (setq use-package-always-ensure t)
   (require 'use-package)))

(menu-bar-mode 0)
(when window-system
  (setq ring-bell-function 'ignore)
  (set-fringe-style 0)
  (set-cursor-color "red")
  (set-scroll-bar-mode nil)
  (tool-bar-mode 0))

(set-face-attribute
 'default
 nil
 :family "Source Code Pro"
 :height 150
 :weight 'medium
 :width 'normal)
(use-package sweet-theme :ensure t :init (load-theme 'sweet t))

(use-package projectile)
(use-package flycheck)
(use-package yasnippet :config (yas-global-mode))
(use-package lsp-mode :hook ((lsp-mode . lsp-enable-which-key-integration))
  :config
  (setq lsp-completion-enable-additional-text-edit nil))

(use-package hydra)
(use-package company)
(use-package lsp-ui)
(use-package which-key :config (which-key-mode))
(use-package dap-mode
  :after
  lsp-mode
  :config
  (dap-auto-configure-mode)
  
  :bind
  (("<f7>" . dap-step-in)
   ("<f8>" . dap-next)
   ("<f9>" . dap-continue)))

(use-package helm-lsp)
(use-package helm
  :config (helm-mode))
(use-package lsp-treemacs)

(setq js-indent-level 2)
(add-hook 'prog-mode-hook #'lsp)

(use-package dap-mode
  :config
  (require 'dap-firefox)
  )

(setq dap-firefox-debug-program
      '("node"
        "/home/torstein/.emacs.d/.extension/vscode/firefox-devtools.vscode-firefox-debug/extension/dist/adapter.bundle.js"))

