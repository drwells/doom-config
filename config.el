;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; its me
(setq user-full-name "David Wells"
      user-mail-address "drwells@fastmail.com")

;; doom theme and default font
(load! "doom-heed-his-words-theme.el")
(load-theme 'doom-heed-his-words t t)
(setq doom-theme 'doom-heed-his-words)
(setq doom-font "DejaVu Sans Mono 12")
(setq window-divider-default-places 'right-only)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Executing code here modifies the modules that have been loaded but have not
;; been executed.
(remove-hook 'doom-load-theme-hook #'doom-themes-org-config)
(remove-hook 'term-mode-hook #'hide-mode-line-mode)

(remove-hook 'term-mode-hook #'evil-collection-term-escape-stay)
(remove-hook 'term-mode-hook #'evil-collection-term-sync-state-and-mode)

;; Setup popup-windows a bit better
;; (plist-put +popup-defaults :modeline t)

(require 'dash)
(setq evil-insert-state-modes (-remove-item 'term-mode evil-insert-state-modes))
(add-to-list 'evil-emacs-state-modes 'term-mode)
(add-to-list 'evil-emacs-state-modes 'grep-mode)
(add-to-list 'evil-emacs-state-modes 'compilation-mode)
(setq evil-motion-state-modes (-remove-item 'compilation-mode evil-motion-state-modes))

(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

;; restore the ancient behavior of evil-surround to also use s
(after! evil-surround
  (evil-define-key 'visual evil-surround-mode-map "s" 'evil-surround-region))

;; magit configuration
(after! magit
  ;; save with confirmation - the default
  (setq magit-save-repository-buffers t))

;; Put my own stuff in some more specific files
(load! "display.el")
(load! "editing.el")
(load! "utilities.el")
