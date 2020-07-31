;;; doom-lake-theme.el
(require 'doom-themes)

;;
(defgroup doom-lake-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-lake-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-lake-theme
  :type 'boolean)

(defcustom doom-lake-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-lake-theme
  :type 'boolean)

(defcustom doom-lake-comment-bg doom-lake-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-lake-theme
  :type 'boolean)

(defcustom doom-lake-padded-modeline nil
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-lake-theme
  :type '(or integer boolean))

;;
(def-doom-theme doom-lake
  "Doom lake theme"

  ;; name        default   256       16
  ((bg         '("#0F0F13" nil       nil            ))
   (bg-alt     '("#0f0f13" nil       nil            ))
   (base0      '("#0E0F14" "#121212" "black"        ))
   (base1      '("#1C1E28" "#1C1C1C" "brightblack"  ))
   (base2      '("#2B2E3B" "#303030" "brightblack"  ))
   (base3      '("#393D4F" "#444444" "brightblack"  ))
   (base4      '("#474C63" "#4E4E4E" "brightblack"  ))
   (base5      '("#555B77" "#5F5F87" "brightblack"  ))
   (base6      '("#636B8B" "#5F5F87" "brightblack"  ))
   (base7      '("#747C9C" "#8787AF" "brightblack"  ))
   (base8      '("#888EAA" "#8787AF" "white"        ))
   (fg-alt     '("#B0B4C6" "#AFAFD7" "brightwhite"  ))
   (fg         '("#9CA1B8" "#A8A8A8" "white"        ))

   (grey       base4)
   (red        '("#E75E87" "#D75F87" "red"          ))
   (orange     '("#E892A1" "#D787AF" "brightred"    ))
   (green      '("#83D1A2" "#87D7AF" "green"        ))
   (teal       '("#B6DAC4" "#AFD7D7" "brightgreen"  ))
   (yellow     '("#E9C5BB" "#D7D7AF" "yellow"       ))
   (blue       '("#5FAFD7" "#AFAFD7" "brightblue"   ))
   (dark-blue  '("#639CE8" "#5FAFD7" "blue"         ))
   (magenta    '("#D3A6F1" "#D7AFFF" "magenta"      ))
   (violet     '("#B972E9" "#AF5FD7" "brightmagenta"))
   (cyan       '("#ACD1E8" "#AFD7D7" "brightcyan"   ))
   (dark-cyan  '("#62B3E4" "#5FAFD7" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-lighten bg 0.05))
   (selection      dark-blue)
   (builtin        blue)
   (comments       (if doom-lake-brighter-comments dark-cyan base5))
   (doc-comments   (doom-lighten (if doom-lake-brighter-comments dark-cyan base5) 0.25))
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
   (-modeline-bright doom-lake-brighter-modeline)
   (-modeline-pad
    (when doom-lake-padded-modeline
      (if (integerp doom-lake-padded-modeline) doom-lake-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        base3
        `(,(doom-lighten (car bg) 0.05) ,@(cdr base0))))  
   (modeline-bg-l
    (if -modeline-bright
        base3
        `(,(doom-lighten (car bg) 0.05) ,@(cdr base0))))
   (modeline-bg-inactive   (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(car bg) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ((line-number &override) :foreground fg-alt)
   ((line-number-current-line &override) :foreground fg)
   ((line-number &override) :background (doom-darken bg 0.025))

   (font-lock-comment-face
    :foreground comments
    :background (if doom-lake-comment-bg (doom-lighten bg 0.05)))
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


   (centaur-tabs-selected :foreground (doom-darken fg 0.8) :background red)
   (centaur-tabs-unselected :foreground fg-alt :background bg)
   (centaur-tabs-selected-modified :foreground (doom-darken fg 0.8) :background red)
   (centaur-tabs-unselected-modified :foreground fg-alt :background bg)
   (centaur-tabs-active-bar-face :background green)
   (centaur-tabs-modified-marker-selected :inherit 'centaur-tabs-selected :foreground green)
   (centaur-tabs-modified-marker-unselected :inherit 'centaur-tabs-unselected :foreground green)

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

;;; doom-lake-theme.el ends here
