; display.el: extra display configuration

(column-number-mode t)
;; wrap very long lines so that they are still visible
(visual-line-mode)

;; wrap lines in compilation mode
(add-hook 'compilation-mode-hook (lambda () (+word-wrap-mode)))

;; show the evil mode
(setq evil-mode-line-format 'before)

;; todo: evil doesn't seem to use a face to color the cursors, so I have not yet
;; figured out how to put this in the theme
(setq evil-emacs-state-cursor '("grey" box))

(global-highlight-parentheses-mode t)

;; I prefer to use org-mode without line numbers - C-c C-p is much more
;; efficient
(add-hook 'org-mode-hook (lambda () (display-line-numbers-mode -1)))

;; always wrap long lines
(+global-word-wrap-mode +1)
