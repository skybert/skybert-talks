(defvar-keymap dape-session-map
  :doc "Dape keymap for blazingly fast navigation."
  "b" #'dape-breakpoint-toggle
  "c" #'dape-continue
  "i" #'dape-step-in
  "n" #'dape-next
  "o" #'dape-step-out
  "p" #'dape-pause
  "q" #'dape-quit
  "r" #'dape-restart
  )

(add-hook 'dape-on-start-hook
          (lambda ()
            (use-local-map (copy-keymap dape-session-map))))
(add-hook 'dape-on-stopped-hook
          (lambda ()
            (use-local-map (default-value 'keymap))))
