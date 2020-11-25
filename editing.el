;; ansi-term configuration
;; see
;; http://stackoverflow.com/questions/6820051/unicode-characters-in-emacs-term-mode
;; (defadvice ansi-term (after advise-ansi-term-coding-system)
;;     (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
;; (ad-activate 'ansi-term)
(setq term-buffer-maximum-size 8192)

;; evil configuration
(setq evil-shift-width 4) ; fix behavior of > and < in normal state.
(setq evil-repeat-move-cursor nil) ; on the . command do not move cursor
(setq +evil-want-o/O-to-continue-comments nil) ; no extra comments from o and O
(setq evil-ex-search-vim-style-regexp nil)
(setq evil-ex-substitute-global nil)

;; try to fix ; and ,
(setq +evil-repeat-keys nil)

(add-to-list 'evil-emacs-state-modes 'dired-mode)
(add-to-list 'evil-emacs-state-modes 'helpful-mode)
(add-to-list 'evil-emacs-state-modes 'help-mode)
(add-to-list 'evil-emacs-state-modes 'debugger-mode)

;; org configuration
(setq org-log-done t) ; display timestamp when I complete something
(add-hook 'org-mode-hook
          (lambda () ; why isn't this the default for RET?
            (progn (local-set-key (kbd "RET") 'org-return-indent)
                   ; never use org's own keybindings for these
                   (local-set-key (kbd "<S-left>") 'windmove-left)
                   (local-set-key (kbd "<S-right>") 'windmove-right)
                   (local-set-key (kbd "<S-down>") 'windmove-down)
                   (local-set-key (kbd "<S-up>") 'windmove-up))))

;; windmove configuration
(windmove-default-keybindings)
