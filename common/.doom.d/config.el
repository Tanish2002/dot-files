(setq doom-font (font-spec :family "Iosevka Term" :size 13)
      doom-big-font (font-spec :family "Iosevka Term" :size 20)
      doom-variable-pitch-font (font-spec :family "Iosevka Term" :size 13))

(setq doom-theme 'doom-solid)

(setq org-directory "~/Documents/org/")

(setq rustic-lsp-server 'rust-analyzer)



(setq display-line-numbers-type 'relative)

;; (setq fancy-splash-image "~/.doom.d/themes/richard.png")
(setq fancy-splash-image "/home/weeb/Downloads/rsz_uihere.png")
(setq doom-modeline-major-mode-icon t)
(add-hook '+doom-dashboard-mode-hook #'hide-mode-line-mode)
(defun doom-dashboard-widget-footer ()
  (insert
   "\n"
   (+doom-dashboard--center
    (- +doom-dashboard--width 2)
    "Config by Tanish2002")
   "\n"
   (+doom-dashboard--center
    (- +doom-dashboard--width 5)
    (with-temp-buffer
      (insert-text-button (or (all-the-icons-faicon "heart" :face 'error :height 1.5 :v-adjust -0.5)
                              (propertize "E M A C S" 'face 'font-lock-keyword-face))
                          'action (lambda (_) (browse-url "https://github.com/karetsu"))
                          'follow-link t
                          'help-echo "github")
      (buffer-string)))
   "\n"))
;; (custom-set-faces!
;;   '(doom-dashboard-footer-icon :inherit all-the-icons-red))

(use-package! neotree
  :config
  (setq neo-window-fixed-size nil
        doom-themes-neotree-file-icons t))

(use-package! centaur-tabs
   :config
   (centaur-tabs-group-by-projectile-project)
   (centaur-tabs-mode t)
   (setq centaur-tabs-style "bar"
         centaur-tabs-height 32
         centaur-tabs-set-icons t
         centaur-tabs-set-modified-marker t
         centaur-tabs-set-bar 'under
         x-underline-at-descent-line t)
   :bind
   ("C-<left>" . centaur-tabs-backward)
   ("C-<right>" . centaur-tabs-forward))

(use-package! elcord
  :config
  (elcord-mode))

(remove-hook 'undo-fu-mode-hook #'global-undo-fu-session-mode)

(defun xah-syntax-color-hex ()
  "Syntax color text of the form 「#ff1100」 and 「#abc」 in current buffer.
URL `http://ergoemacs.org/emacs/emacs_CSS_colors.html'
Version 2017-03-12"
  (interactive)
  (font-lock-add-keywords
   nil
   '(("#[[:xdigit:]]\\{3\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background
                      (let* (
                             (ms (match-string-no-properties 0))
                             (r (substring ms 1 2))
                             (g (substring ms 2 3))
                             (b (substring ms 3 4)))
                        (concat "#" r r g g b b))))))
     ("#[[:xdigit:]]\\{6\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background (match-string-no-properties 0)))))))
  (font-lock-flush))

;; (setq evil-default-state 'emacs)

(load! "kak.el")
;; (use-package! boon
;;    :config
;;    (require 'boon-qwerty)
;;    (boon-mode))


