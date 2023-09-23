;; display.el: extra display configuration

(column-number-mode t)

;; wrap lines in compilation mode
(add-hook 'compilation-mode-hook (lambda () (+word-wrap-mode)))
;; and programming
(add-hook 'prog-mode-hook (lambda () (+word-wrap-mode)))

;; show the evil mode
(setq evil-mode-line-format 'before)

;; todo: evil doesn't seem to use a face to color the cursors, so I have not yet
;; figured out how to put this in the theme
(setq evil-emacs-state-cursor '("grey" box))

;; prevent pop-up windows when debugging with GDB
(setq gdb-display-io-nopopup t)

(global-highlight-parentheses-mode)

;; I prefer to use org-mode without line numbers - C-c C-p is much more
;; efficient
(add-hook 'org-mode-hook (lambda () (display-line-numbers-mode -1)))

;; always show modelines
(remove-hook '+popup-buffer-mode-hook #'+popup-set-modeline-on-enable-h)

;; wrap very long lines so that they are still visible
(visual-line-mode)
