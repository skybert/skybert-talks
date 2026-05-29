(defvar-keymap dape-session-map
  :doc "Keymap active during a dape debug session."
  "n" #'dape-next
  "i" #'dape-step-in
  "o" #'dape-step-out
  "c" #'dape-continue
  "p" #'dape-pause
  "R" #'dape-restart
  "b" #'dape-breakpoint-toggle
  "q" #'dape-quit)

(define-minor-mode tkj/dape-session-mode
  "Active for the lifetime of a dape debug session.
Provides single-key debugger commands and makes the buffer read-only
so those keys never accidentally edit code. Restores prior writability
on exit."
  :keymap dape-session-map
  (cond
   (tkj/dape-session-mode
    (when (and buffer-file-name (not buffer-read-only))
      (setq-local tkj/dape--restore-writable t)
      (read-only-mode 1)))
   ((bound-and-true-p tkj/dape--restore-writable)
    (read-only-mode -1)
    (kill-local-variable 'tkj/dape--restore-writable))))

(defun tkj/dape-toggle-all (on)
  "Toggle `tkj/dape-session-mode' in every file buffer."
  (interactive (list (not (bound-and-true-p tkj/dape-session-mode))))
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when buffer-file-name
        (tkj/dape-session-mode (if on 1 -1))))))

;; Defer hook/advice setup until dape has actually loaded — otherwise
;; `add-hook' creates `dape-start-hook' before dape's defcustom runs,
;; clobbering the default `(dape-repl dape-info)' value and leaving
;; the session without info/repl windows.
(with-eval-after-load 'dape
  (add-hook 'dape-start-hook (lambda () (tkj/dape-toggle-all t)))
  ;; Catches files reached via step-in that weren't open at start.
  (add-hook 'dape-display-source-hook
            (lambda () (when buffer-file-name (tkj/dape-session-mode 1))))
  ;; dape 0.27.1 has no termination hook, so advise quit/kill directly.
  (advice-add 'dape-quit :after (lambda (&rest _) (tkj/dape-toggle-all nil)))
  (advice-add 'dape-kill :after (lambda (&rest _) (tkj/dape-toggle-all nil)))
