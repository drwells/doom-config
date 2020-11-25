; utilities.el: some extra elisp functions that are globally useful

;; Unfortunately, flyspell-prog-mode will only check the portion of the buffer
;; that it knows are comments or strings, which is limited to the surrounding
;; 500 characters (about one screen's worth of text). To get around this,
;; highlight the whole buffer before doing any syntax highlighting and then
;; reset the value.
(defun spell-check-with-fontify ()
  "Spell check the whole buffer with fontification"
  (interactive)
  (let ((previous-chunk-size jit-lock-chunk-size))
    (save-excursion
      (setq jit-lock-chunk-size (point-max))
      (font-lock-default-fontify-region (point-min) (point-max) nil)
      (flyspell-buffer)
      (setq jit-lock-chunk-size previous-chunk-size))))
