;;; ~/dotfiles/doom/.doom.d/kak.el -*- lexical-binding: t; -*-

(use-package! kakoune
  ;; Having a non-chord way to escape is important, since key-chords don't work in macros
  :bind ("C-z" . ryo-modal-mode)
  :hook (after-init . my/kakoune-setup)
  :config
  (defun ryo-enter () "Enter normal mode" (interactive) (ryo-modal-mode 1))
  (defun my/kakoune-setup ()
      (kakoune-setup-keybinds)
      (setq ryo-modal-cursor-type 'box)
      "Call kakoune-setup-keybinds and then add some personal config."
      (setq ryo-modal-cursor-color nil)
      (add-hook 'prog-mode-hook #'ryo-enter)
      (add-hook 'text-mode-hook #'ryo-enter)
      (add-hook '+doom-dashboard-mode-hook #'ryo-enter)
      (add-hook '+popup-mode-hook #'ryo-enter)
;;      (map! :map ryo-modal-mode-map
;;            "SPC" #'doom/leader)
      (ryo-modal-keys
       ("SPC")
       (";" kakoune-deactivate-mark)
       ("#" comment-line :then '(previous-line))
       ("P" kakoune-paste-above)
       ("C" mc/mark-next-like-this)
       ("M-C" mc/unmark-next-like-this)
       ("E" mc/mark-previous-like-this)
       ("M-E" mc/unmark-previous-like-this)
       ("M-p" mc/skip-to-previous-like-this)
       ("M-n" mc/skip-to-next-like-this)
       ("M-m" mc/edit-lines)
       ("*" mc/mark-all-like-this)
       ("M-s" mc/split-region)
       ("C-u" scroll-up-command :first '(deactivate-mark))
       ("C-d" scroll-down-command :first '(deactivate-mark))
       ("Z Z" kill-emacs :first '(save-buffer))
       ("Z Q" kill-emacs)
       ("z x" kill-current-buffer)
       (":" counsel-M-x)
       ("v" er/expand-region)
       ("SPC <left>" beginning-of-line)
       ("SPC <right>" end-of-line)
       ("/" phi-search)
       ("S-/" phi-search-backward))))

;; This overrides the default mark-in-region with a prettier-looking one,
;; and provides a couple extra commands
(use-package! visual-regexp
  :ryo
  ("s" vr/mc-mark)
  ("?" vr/replace)
  ("M-/" vr/query-replace))

;; Emacs incremental search doesn't work with multiple cursors, but this fixes that
(use-package! phi-search
  :bind
  (("C-s" . phi-search)
   ("C-r" . phi-search-backward)))

;; Probably the first thing you'd miss is undo and redo, which requires an extra package
;; to work like it does in kakoune (and almost every other editor).
(use-package! undo-fu
  :config
  :ryo
  ("u" undo-fu-only-undo)
  ("U" undo-fu-only-redo))

(global-set-key (kbd "<escape>") 'ryo-modal-mode)
(define-key ryo-modal-mode-map (kbd "<escape>") 'keyboard-quit)
;; (evil-set-initial-state 'prog-mode 'emacs)
;; (evil-set-initial-state 'text-mode 'emacs)
;; (evil-set-initial-state 'org-mode 'emacs)
;; (setq ryo-modal-cursor-type 'bar)
(setq-default cursor-type 'bar)
(set-cursor-color "green")
