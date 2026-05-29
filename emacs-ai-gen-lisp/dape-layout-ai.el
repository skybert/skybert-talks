(add-to-list 'display-buffer-alist '((category . dape-info-0) nil (window-width . 60)))
(add-to-list 'display-buffer-alist '((category . dape-info-1) nil (window-width . 60)))
(add-to-list 'display-buffer-alist '((category . dape-info-2) nil (window-width . 60)))

;; Auto-fit the variable value column to the live window width so the
;; locals/watch tables don't overflow. Advice runs per row and rebinds
;; `dape-info-variable-table-row-config' for that single render.
(defun tkj/dape-fit-value-column (orig alist)
  "Auto-size the variable value column to the current dape-info window."
  (let* ((win (get-buffer-window (current-buffer)))
         (w (if win (window-width win) 80))
         (cfg dape-info-variable-table-row-config)
         (name-w (or (alist-get 'name cfg) 0))
         (type-w (or (alist-get 'type cfg) 0))
         ;; Indent prefix + expand handle + column separators.
         (overhead 6)
         (value-w (max 10 (- w name-w type-w overhead)))
         (dape-info-variable-table-row-config
          (mapcar (lambda (c)
                    (if (eq (car c) 'value) (cons 'value value-w) c))
                  cfg)))
    (funcall orig alist)))

;; Repaint info buffers when the user drags the side-window divider so
;; the value column re-fits the new width.
(defun tkj/dape-refresh-on-resize (frame)
  (when (and (bound-and-true-p dape--connection)
             (cl-some (lambda (win)
                        (with-current-buffer (window-buffer win)
                          (derived-mode-p 'dape-info-parent-mode)))
                      (window-list frame)))
    (dape-info-update)))

;; Resize the dape info side-windows so dape-info-0 (locals) takes
;; ~90% of the side column. Per-slot `(window-height . FRACTION)' on
;; `display-buffer-alist' doesn't survive sequential side-window
;; creation, so we fix it after dape has displayed all groups.
(defun tkj/dape-layout-sidebar ()
  (when (memq dape-buffer-window-arrangement '(left right))
    (let* ((side dape-buffer-window-arrangement)
           (sorted
            (sort
             (cl-remove-if-not
              (lambda (w)
                (and (eq (window-parameter w 'window-side) side)
                     (with-current-buffer (window-buffer w)
                       (derived-mode-p 'dape-info-parent-mode))))
              (window-list nil 'no-mini))
             (lambda (a b)
               (< (or (window-parameter a 'window-slot) 0)
                  (or (window-parameter b 'window-slot) 0))))))
      (when (>= (length sorted) 2)
        (let* ((n (length sorted))
               (total (cl-loop for w in sorted sum (window-total-height w)))
               (rest-each (max 3 (floor (* 0.1 total) (1- n)))))
          ;; Shrink the secondary windows from bottom-up; freed lines
          ;; flow into the predecessor sibling, accumulating in the
          ;; locals window (top of chain). Resizing locals directly
          ;; redistributed lines unpredictably across both siblings.
          (dolist (w (reverse (cdr sorted)))
            (let ((delta (- rest-each (window-total-height w))))
              (unless (zerop delta)
                (ignore-errors
                  (let ((window-size-fixed nil))
                    (window-resize w delta nil t)))))))))))

(add-hook 'dape-start-hook
          (lambda () (run-with-timer 0 nil #'tkj/dape-layout-sidebar))
          t)
(advice-add 'dape-quit :after (lambda (&rest _) (tkj/dape-toggle-all nil)))
(advice-add 'dape-kill :after (lambda (&rest _) (tkj/dape-toggle-all nil)))
(advice-add 'dape--info-locals-table-columns-list
            :around #'tkj/dape-fit-value-column)
