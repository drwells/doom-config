;; heed-his-words.el --- Like the old Comida theme, but with bright comments -*- no-byte-compile: t; -*-
(require 'doom-themes)

;;
(defgroup doom-heed-his-words-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-heed-his-words-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-heed-his-words-theme
  :type 'boolean)

(defcustom doom-heed-his-words-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-heed-his-words-theme
  :type 'boolean)

(defcustom doom-heed-his-words-comment-bg doom-heed-his-words-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-heed-his-words-theme
  :type 'boolean)

(defcustom doom-heed-his-words-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-heed-his-words-theme
  :type '(choice integer boolean))


;;
(def-doom-theme doom-heed-his-words
  "A dark theme based off of doom-one with more heed-his-words colors."

  ;; name        gui       256       16
  ((bg         '("#1f1f1f" nil       nil))
   (bg-alt     '("#1f1f1f" nil       nil))
   (base0      '("#1c1f24" "#101010" "black"        ))
   (base1      '("#1c1f24" "#1e1e1e" "brightblack"  ))
   (base2      '("#21272d" "#21212d" "brightblack"  ))
   (base3      '("#23272e" "#262626" "brightblack"  ))
   (base4      '("#b3b3b3" "#c0c0c0" "silver"))
   (base5      '("#62686E" "#666666" "brightblack"  ))
   (base6      '("#757B80" "#7b7b7b" "brightblack"  ))
   (base7      '("#9ca0a4" "#979797" "brightblack"  ))
   (base8      '("#DFDFDF" "#dfdfdf" "white"))
   (fg         '("#4682b4" "#5f87af" "white"))
   (fg-alt     '("#5D656B" "#5d5d5d" ))

   (black      '("#000000" "#000000" "black"))
   (white      '("#ffffff" "#ffffff" "white"))
   (light-grey '("#cccccc" "#cccccc" "white"))
   (grey       base4)
   (medium-grey '("#696969" "c0c0c0" "silver"))
   (red        '("#f50101" "#ff0000" "red"))
   (orange     '("#ffa500" "#ffaf00" "olive"))
   (pale-green '("#7fffd4" "#87ffaf" "lime"))
   (light-green '("#98fb98" "#87ff5f" "lime"))
   (green      '("#7bc275" "#99bb66" ))
   (teal       '("#00ffff" "#00ffff" "aqua"))
   (salmon     '("#ffa07a" "#ffaf87" "yellow"))
   (pink       '("#ffc0cb" "#ffafaf" "fuchsia"))
   (silver     '("#b0c4de" "#d7d7ff" "silver"))
   (yellow     '("#FCCE7B"           ))
   (blue       '("#51afef"           ))
   (light-blue '("#87cefa" "#afd7ff" "white"))
   (dark-blue  '("#1f5582"           ))
   (magenta    '("#C57BDB"           ))
   (violet     '("#a991f1"           )) ;a9a1e1
   (cyan       '("#5cEfFF"           ))
   (dark-cyan  '("#6A8FBF"           ))

   ;; face categories
   (highlight      blue)
   (vertical-bar   fg)
   (selection      dark-blue)
   (builtin        silver)
   (comments       orange)
   (doc-comments   orange)
   (constants      pale-green)
   (functions      light-blue)
   (keywords       teal)
   (methods        pale-green)
   (operators      pale-green)
   (type           light-green)
   (strings        salmon)
   (variables      base8)
   (negation       red)
   (numbers        (doom-lighten fg 0.25))
   (region         "#3d4451")
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    yellow)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (hidden-alt `(,(car bg-alt) "black" "black"))
   (-modeline-pad -1)

   (modeline-fg     light-grey)
   (modeline-fg-alt black)

   (modeline-bg medium-grey)
   (modeline-bg-l medium-grey)
   (modeline-bg-inactive `(,(doom-darken (car modeline-bg) 0.2) ,@(cdr modeline-bg)))
   (modeline-bg-inactive-l `(,(doom-darken (car modeline-bg) 0.2) ,@(cdr modeline-bg)))
   )


  ;; --- extra faces ------------------------
  (((all-the-icons-dblue &override) :foreground dark-cyan)
   (centaur-tabs-unselected :background bg-alt :foreground base6)
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   (font-lock-comment-face
    :foreground comments
    :slant 'italic)

   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (font-lock-negation-char-face
    :foreground negation
    )

   ;; restore defaults for outline mode
   (outline-1 :inherit 'font-lock-function-name-face)
   (outline-2 :inherit 'font-lock-variable-name-face)
   (outline-3 :inherit 'font-lock-keyword-face)
   (outline-4 :inherit 'font-lock-comment-face)
   (outline-5 :inherit 'font-lock-type-face)
   (outline-6 :inherit 'font-lock-constant-face)
   (outline-7 :inherit 'font-lock-builtin-face)
   (outline-8 :inherit 'font-lock-string-face)

   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground base4)

   (doom-modeline-bar :background (if doom-heed-his-words-brighter-modeline modeline-bg highlight))
   (doom-modeline-buffer-path :foreground (if doom-heed-his-words-brighter-modeline base8 blue) :bold bold)

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box '(:line-width -1 :style released-button)
    )
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if doom-heed-his-words-brighter-modeline base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   (whitespace-empty :background base2)

   ;; --- major-mode faces -------------------

   ;; org-mode
   ; restore some more defaults
   (org-todo :foreground pink :bold bold 'inherit)
   (org-done :foreground light-green :bold bold 'inherit)
   (org-verbatim :foreground base4)

   ;; magit-mode: continue restoring defaults

   ;; evil-mode:

   )


  ;; --- extra variables --------------------
  ;; ()
  )

;;; doom-heed-his-words-theme.el ends here
