;;; doom-selenized-dark-theme.el --- inspired by VS Code Solarized Dark -*- no-byte-compile: t; -*-
(require 'doom-themes)

;;
(defgroup doom-selenized-dark-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-selenized-dark-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-selenized-dark-theme
  :type 'boolean)

(defcustom doom-selenized-dark-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-selenized-dark-theme
  :type 'boolean)

(defcustom doom-selenized-dark-brighter-text nil
  "If non-nil, default text will be brighter."
  :group 'doom-selenized-dark-theme
  :type 'boolean)

(defcustom doom-selenized-dark-comment-bg doom-selenized-dark-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-selenized-dark-theme
  :type 'boolean)

(defcustom doom-selenized-dark-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-selenized-dark-theme
  :type '(choice integer boolean))

;;
(def-doom-theme doom-selenized-dark
  "A dark theme inspired by VS Code Solarized Dark"

  ;; name        default   256       16
  ((bg         '("#101411" "#002b36"       nil     ))
   (bg-alt     '("#101411" "#00212B"       nil     ))
   (base0      '("#073642" "#073642"   "black"     ))
   (base1      '("#03282F" "#03282F" "brightblack" ))
   (base2      '("#00212C" "#00212C" "brightblack" ))
   (base3      '("#13383C" "#13383C" "brightblack" ))
   (base4      '("#abb2bd" "#56697A" "brightblack" ))
   (base5      '("#405A61" "#405A61" "brightblack" ))
   (base6      '("#96A7A9" "#96A7A9" "brightblack" ))
   (base7      '("#788484" "#788484" "brightblack" ))
   (base8      '("#626C6C" "#626C6C" "white"       ))
   (fg-alt     '("#657b83" "#657b83" "white"       ))
   (fg         (if doom-selenized-dark-brighter-text
		   '("#e5e0d9" "#e5e0d9" "brightwhite")
		   '("#f0f1f5" "#f0f1f5" "brightwhite")))

   (grey       base4)
   (red        '("#da4452" "#ff6655" "red"          ))
   (orange     '("#ec5564" "#dd8844" "brightred"    ))
   (green      '("#8cc051" "#99bb66" "green"        ))
   (teal       '("#a0d467" "#33aa99" "brightgreen"  ))
   (yellow     '("#f7bb42" "#ECBE7B" "yellow"       ))
   (blue       '("#5e9ceb" "#51afef" "brightblue"   ))
   (dark-blue  '("#4a8add" "#2257A0" "blue"         ))
   (magenta    '("#967bdd" "#c678dd" "magenta"      ))
   (violet     '("#ac92ed" "#a9a1e1" "brightmagenta"))
   (cyan       '("#4ec1e8" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#3bafda" "#5699AF" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.5))
   (selection      dark-blue)
   (builtin        blue)
   (comments       (if doom-selenized-dark-brighter-comments blue base5))
   (doc-comments   teal)
   (constants      magenta)
   (functions      blue)
   (keywords       green)
   (methods        cyan)
   (operators      orange)
   (type           yellow)
   (strings        cyan)
   (variables      fg)
   (numbers        magenta)
   (region         base0)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    yellow)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-selenized-dark-brighter-modeline)
   (-modeline-pad
    (when doom-selenized-dark-padded-modeline
      (if (integerp doom-selenized-dark-padded-modeline) doom-selenized-dark-padded-modeline 4)))

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
  ((company-tooltip-selection     :background dark-cyan)
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)

   (helm-selection :inherit 'bold
                   :background selection
                   :distant-foreground bg
                   :extend t)

   (font-lock-comment-face
    :foreground comments
    :background (if doom-selenized-dark-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)
   (font-lock-keyword-face
    :weight 'bold
    :foreground keywords)
   (font-lock-constant-face
    :weight 'bold
    :foreground constants)

   ;; Centaur tabs
   (centaur-tabs-active-bar-face :background blue)
   (centaur-tabs-modified-marker-selected :inherit 'centaur-tabs-selected
                                          :foreground blue)
   (centaur-tabs-modified-marker-unselected :inherit 'centaur-tabs-unselected
                                            :foreground blue)
   ;; Doom modeline
   (doom-modeline-bar :background blue)

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   (tooltip              :background bg-alt :foreground fg)
   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-url-face    :foreground teal :weight 'normal)
   (markdown-reference-face :foreground base6)
   ((markdown-bold-face &override)   :foreground fg)
   ((markdown-italic-face &override) :foreground fg-alt)

   ;; outline (affects org-mode)
   ((outline-1 &override) :foreground blue)
   ((outline-2 &override) :foreground green)
   ((outline-3 &override) :foreground teal)
   ((outline-4 &override) :foreground (doom-darken blue 0.2))
   ((outline-5 &override) :foreground (doom-darken green 0.2))
   ((outline-6 &override) :foreground (doom-darken teal 0.2))
   ((outline-7 &override) :foreground (doom-darken blue 0.4))
   ((outline-8 &override) :foreground (doom-darken green 0.4))

   ;; org-mode
   ((org-block &override) :background base0)
   ((org-block-begin-line &override) :foreground comments :background base0)
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden))
  ;; --- extra variables ---------------------
  ;; ()
  )

;;; doom-selenized-dark-theme.el ends here
