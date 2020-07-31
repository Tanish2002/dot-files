;;; doom-nord-theme.el
(require 'doom-themes)

;;
(defgroup doom-nord-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-nord-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-nord-theme
  :type 'boolean)

(defcustom doom-nord-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-nord-theme
  :type 'boolean)

(defcustom doom-nord-comment-bg doom-nord-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-nord-theme
  :type 'boolean)

(defcustom doom-nord-padded-modeline nil
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-nord-theme
  :type '(or integer boolean))

;;
(def-doom-theme doom-nord
  "Doom nord theme"

  ;; name        default   256       16
  ((bg         '("#2E3440" nil       nil            ))
   (bg-alt     '("#3F4757" nil       nil            ))
   (base0      '("#10151D" "#121212" "black"        ))
   (base1      '("#202939" "#303030" "brightblack"  ))
   (base2      '("#313E56" "#444444" "brightblack"  ))
   (base3      '("#415273" "#585858" "brightblack"  ))
   (base4      '("#516790" "#5F5F87" "brightblack"  ))
   (base5      '("#657DA8" "#5F87AF" "brightblack"  ))
   (base6      '("#8295B8" "#8787AF" "brightblack"  ))
   (base7      '("#9FADC9" "#AFAFD7" "brightblack"  ))
   (base8      '("#BBC6D9" "#AFD7D7" "white"        ))
   (fg-alt     '("#E0E5ED" "#E4E4E4" "brightwhite"  ))
   (fg         '("#D8DEE9" "#E4E4E4" "white"        ))

   (grey       base4)
   (red        '("#BF616A" "#AF5F5F" "red"          ))
   (orange     '("#D5967A" "#D78787" "brightred"    ))
   (green      '("#82A662" "#87AF5F" "green"        ))
   (teal       '("#A3BE8C" "#AFAF87" "brightgreen"  ))
   (yellow     '("#EBCB8B" "#D7D787" "yellow"       ))
   (blue       '("#81A1C1" "#87AFAF" "brightblue"   ))
   (dark-blue  '("#5681AC" "#5F87AF" "blue"         ))
   (magenta    '("#9A6791" "#875F87" "magenta"      ))
   (violet     '("#B48EAD" "#AF87AF" "brightmagenta"))
   (cyan       '("#8FBCBB" "#87AFAF" "brightcyan"   ))
   (dark-cyan  '("#88C0D0" "#87AFD7" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-lighten bg 0.05))
   (selection      dark-blue)
   (builtin        blue)
   (comments       (if doom-nord-brighter-comments dark-cyan base5))
   (doc-comments   (doom-lighten (if doom-nord-brighter-comments dark-cyan base5) 0.25))
   (constants      red)
   (functions      yellow)
   (keywords       blue)
   (methods        cyan)
   (operators      blue)
   (type           yellow)
   (strings        teal)
   (variables      cyan)
   (numbers        magenta)
   (region         dark-blue)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-nord-brighter-modeline)
   (-modeline-pad
    (when doom-nord-padded-modeline
      (if (integerp doom-nord-padded-modeline) doom-nord-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        base3
        `(,(doom-darken (car bg) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        base3
        `(,(doom-darken (car bg) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(car bg) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ((line-number &override) :foreground fg-alt)
   ((line-number-current-line &override) :foreground fg)
   ((line-number &override) :background (doom-darken bg 0.025))

   (font-lock-comment-face
    :foreground comments
    :background (if doom-nord-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))
   (mode-line-buffer-id
    :foreground highlight)

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   (telephone-line-accent-active
    :inherit 'mode-line
    :background (doom-lighten bg 0.2))
   (telephone-line-accent-inactive
    :inherit 'mode-line
    :background (doom-lighten bg 0.05))
   (telephone-line-evil-emacs
    :inherit 'mode-line
    :background dark-blue)

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-code-face :background (doom-lighten base3 0.05))

   ;; org-mode
   (org-hide :foreground hidden)
   (org-block :background base2)
   (org-block-begin-line :background base2 :foreground comments)
   (solaire-org-hide-face :foreground hidden))


  ;; --- extra variables ---------------------
  ;; ()
  )

;;; doom-nord-theme.el ends here