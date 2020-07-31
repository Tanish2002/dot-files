;;; doom-solid-theme.el
(require 'doom-themes)

;;
(defgroup doom-solid-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-solid-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-solid-theme
  :type 'boolean)

(defcustom doom-solid-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-solid-theme
  :type 'boolean)

(defcustom doom-solid-comment-bg doom-solid-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-solid-theme
  :type 'boolean)

(defcustom doom-solid-padded-modeline nil
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-solid-theme
  :type '(or integer boolean))

;;
(def-doom-theme doom-solid
  "Doom solid theme"

  ;; name        default   256       16
  ((bg         '("#101411" nil       nil            ))
   (bg-alt     '("#101411" nil       nil            ))
   (base0      '("#1A1712" "#121212" "black"        ))
   (base1      '("#352E24" "#303030" "brightblack"  ))
   (base2      '("#4F4536" "#444444" "brightblack"  ))
   (base3      '("#84735a" "#585858" "brightblack"  ))
   (base4      '("#84735B" "#875F5F" "brightblack"  ))
   (base5      '("#9D8A6F" "#AF875F" "brightblack"  ))
   (base6      '("#AF9F8A" "#AFAF87" "brightblack"  ))
   (base7      '("#C1B5A4" "#B2B2B2" "brightblack"  ))
   (base8      '("#D3CABF" "#C6C6C6" "white"        ))
   (fg-alt     '("#EAE6E1" "#E4E4E4" "brightwhite"  ))
   (fg         '("#E5E0D9" "#E4E4E4" "white"        ))

   (grey       base4)
   (red        '("#DA4452" "#D75F5F" "red"          ))
   (orange     '("#ED8A53" "#FF875F" "brightred"    ))
   (green      '("#8CC051" "#87AF5F" "green"        ))
   (teal       '("#A0D467" "#AFD75F" "brightgreen"  ))
   (yellow     '("#FFCF54" "#FFD75F" "yellow"       ))
   (blue       '("#5E9CEB" "#5FAFD7" "brightblue"   ))
   (dark-blue  '("#4A8ADD" "#5F87D7" "blue"         ))
   (magenta    '("#AC92ED" "#AF87FF" "magenta"      ))
   (violet     '("#967BDD" "#8787D7" "brightmagenta"))
   (cyan       '("#4EC1E8" "#5FAFD7" "brightcyan"   ))
   (dark-cyan  '("#3BAFDA" "#5FAFD7" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-lighten bg 0.05))
   (selection      dark-blue)
   (builtin        blue)
   (comments       (if doom-solid-brighter-comments dark-cyan base5))
   (doc-comments   (doom-lighten (if doom-solid-brighter-comments dark-cyan base5) 0.25))
   (constants      red)
   (functions      yellow)
   (keywords       blue)
   (methods        cyan)
   (operators      blue)
   (type           yellow)
   (strings        teal)
   (variables      cyan)
   (numbers        magenta)
   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base1) 0.35)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-solid-brighter-modeline)
   (-modeline-pad
    (when doom-solid-padded-modeline
      (if (integerp doom-solid-padded-modeline) doom-solid-padded-modeline 4)))

   ;; (modeline-fg     nil)
   ;; (modeline-fg-alt base5)


   ;; (modeline-bg bg-alt)
   ;; (modeline-bg-l bg)
   ;; (modeline-bg-inactive   `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg-alt)))
   ;; (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1))))

     (modeline-fg     nil)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        base3
        `(,(doom-lighten (car bg) 0.07) ,@(cdr base1))))
   (modeline-bg-l
    (if -modeline-bright
        base3
        `(,(doom-lighten (car bg) 0.07) ,@(cdr base1))))
   (modeline-bg-inactive   (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(car bg) ,@(cdr base1))))

  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ((line-number &override) :foreground fg-alt)
   ((line-number-current-line &override) :foreground fg)
   ((line-number &override) :background (doom-darken bg 0.025))

   (font-lock-comment-face
    :foreground comments
    :background (if doom-solid-comment-bg (doom-lighten bg 0.05)))
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

   (centaur-tabs-selected :foreground (doom-darken fg 1) :background violet)
   (centaur-tabs-unselected :foreground fg-alt :background bg)
   (centaur-tabs-selected-modified :foreground (doom-darken fg 1) :background violet)
   (centaur-tabs-unselected-modified :foreground fg-alt :background bg)
   (centaur-tabs-active-bar-face :background green)
   (centaur-tabs-modified-marker-selected :inherit 'centaur-tabs-selected :foreground green)
   (centaur-tabs-modified-marker-unselected :inherit 'centaur-tabs-unselected :foreground green)

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

   ;;diff-mode
   (diff-removed :foreground red :background nil)
   (whitespace-tab :background nil)
   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-code-face :background (doom-lighten base3 0.05))

   ;; org-mode
   (org-hide :foreground hidden)
   (org-block :background (doom-lighten base0 0.03))
   (org-block-begin-line :background (doom-lighten base0 0.05) :foreground teal)
   (solaire-org-hide-face :foreground hidden))




  ;; --- extra variables ---------------------
  ;; ()
  )

;;; doom-solid-theme.el ends here
