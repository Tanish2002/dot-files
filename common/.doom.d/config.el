(setq doom-font (font-spec :family "Mononoki Nerd Font" :size 13)
       doom-variable-pitch-font (font-spec :family "Mononoki Nerd Font" :size 13))

(setq doom-theme 'doom-palenight)

(setq org-directory "~/Documents/org/")

(setq rustic-lsp-server 'rust-analyzer)





(setq display-line-numbers-type 'relative)

(setq neo-window-fixed-size nil)
(setq doom-themes-neotree-file-icons t)

(use-package! centaur-tabs
   :config
   (setq centaur-tabs-style "bar"
	  centaur-tabs-height 32
	  centaur-tabs-set-icons t
	  centaur-tabs-set-modified-marker t
	  centaur-tabs-set-bar 'under
	  x-underline-at-descent-line t)
   :bind
   ("C-<left>" . centaur-tabs-backward)
   ("C-<right>" . centaur-tabs-forward)
   (:map evil-normal-state-map
	  ("g t" . centaur-tabs-forward)
	  ("g T" . centaur-tabs-backward)))
