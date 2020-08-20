;;; dip-theme.el --- An Emacs theme to spice up food with.
;; Copyright © Niclas Meyer

;; Author: Niclas Meyer <niclas@countingsort.com>
;; URL: http://countingsort.com/
;; Version: 0.0.1

;;; Commentary:

;; Emacs theming has so many possibilities, that go beyond just a color scheme.
;; This is my attempt at using them.

;;; Code:

(deftheme dip
  "An Emacs theme to spice up food with.")

(let ((fg "#535353")
      (bg "#f1e9c4")
      (bg-hl "#e1d9b4")
      (bg-light "#f8f2cc")
      (mode-line "#e1d9b4")
      (cursor "#323232")
      (emph "#323232")
      (link "#305e9a")
      (keyword "#a252a2")
      (builtin "#783234")
      (muted "#929292")
      (type "#c72323")
      (string "#529262")
      (constant "#783234")
      (preprocessor "#929292")
      (variable "#783234")
      (org-todo "#783234")
      (org-done "#529262")
      (org-date "#a252a2")
      (org-checkbox "#535353")
      (org-special "#929292"))
  (custom-theme-set-faces
   'dip

   ;; basic
   `(default ((t (:background ,bg :foreground ,fg))))
   `(italic ((t (:foreground ,emph :slant italic))))
   `(region ((t (:background ,bg-hl))))
   `(cursor ((t (:background ,cursor :foreground ,bg))))
   `(fringe ((t (:background ,bg))))
   `(mode-line ((t (:background ,mode-line))))
   `(link ((t (:underline (:color ,link :style line) :foreground ,link))))
   `(link-visited ((t (:underline (:color ,link :style line) :foreground ,link))))
   `(font-lock-comment-face ((t (:foreground ,muted))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,muted))))
   `(font-lock-type-face ((t (:foreground ,type))))
   `(font-lock-keyword-face ((t (:foreground ,keyword))))
   `(font-lock-builtin-face ((t (:foreground ,builtin))))
   `(font-lock-string-face ((t (:foreground ,string))))
   `(font-lock-doc-face ((t (:foreground ,string))))
   `(font-lock-constant-face ((t (:foreground ,constant))))
   `(font-lock-variable-name-face ((t (:foreground ,variable))))
   `(font-lock-function-name-face ((t (:foreground ,variable))))
   `(font-lock-warning-face ((t (:foreground ,emph))))
   `(font-lock-preprocessor-face ((t (:foreground ,preprocessor))))

   ;; org-mode
   `(org-todo ((t (:foreground ,org-todo))))
   `(org-done ((t (:foreground ,org-done))))
   `(org-level-1 ((t (:foreground ,emph))))
   `(org-level-2 ((t (:foreground ,emph))))
   `(org-level-3 ((t (:foreground ,emph))))
   `(org-level-4 ((t (:foreground ,emph))))
   `(org-level-5 ((t (:foreground ,emph))))
   `(org-level-6 ((t (:foreground ,emph))))
   `(org-level-7 ((t (:foreground ,emph))))
   `(org-level-8 ((t (:foreground ,emph))))
   `(org-document-title ((t (:foreground ,emph))))
   `(org-footnote ((t (:foreground ,muted))))
   `(org-verbatim ((t (:foreground ,constant))))
   `(org-block-begin-line ((t (:background ,bg-hl))))
   `(org-block ((t (:background ,bg-light :foreground ,fg))))
   `(org-link ((t (:foreground ,link))))
   `(org-checkbox-statistics-todo ((t (:foreground ,org-checkbox))))
   `(org-checkbox-statistics-done ((t (:foreground ,org-checkbox))))
   `(org-priority ((t (:foreground ,fg))))
   `(org-date ((t (:foreground ,org-date))))
   `(org-sexp-date ((t (:foreground ,org-date))))
   `(org-special-keyword ((t (:foreground ,org-special))))

   ;; misc
   `(magit-section-highlight ((t :background ,bg-hl)))
   `(swiper-background-match-face-1 ((t :background ,bg-hl)))
   `(swiper-background-match-face-2 ((t :background ,bg-hl)))
   `(swiper-background-match-face-3 ((t :background ,bg-hl)))
   `(swiper-background-match-face-4 ((t :background ,bg-hl)))
   `(swiper-match-face-1 ((t (:foreground ,emph))))
   `(swiper-match-face-2 ((t (:foreground ,emph))))
   `(swiper-match-face-3 ((t (:foreground ,emph))))
   `(swiper-match-face-4 ((t (:foreground ,emph))))
   ))

(provide-theme 'dip)
;;; dip-theme.el ends here

