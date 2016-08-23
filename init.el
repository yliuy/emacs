;;; Emacs init file of Ying Liu


;;; Package repositories
(require 'package)                     ;; Emacs package system
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
	     '("elpha" . "http://tromey.com/elpha"))
;; Add the user contributed repository
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpha.org/packages/"))
;; Add org mode related repository
(add-to-list 'package-archives '("org" . "http://melpa.org/packages/") t)

;; Load packages before the end of this init file
(setq package-enable-at-startup nil)
(package-initialize)

;;; Required packages
(require 'org)                                ;; org mode
(require 'ob-python)                          ;; run python code
(require 'ob-emacs-lisp)                      ;; run emacs-lisp code
;(require 'org-latex)                          ;; Latex export for org mode
(require 'ox-publish)                         ;; org mode publish
(require 'cl)                                 ;; Common lisp for emacs, required by org-drill
;(require 'org-drill)                          ;; flashcard and spaced repetition for org-mode. Must install org-plus-contrib
(require 'smex)                               ;; Smart M-x
(require 'visual-regexp)                      ;; visual regexp
(require 'visual-regexp-steroids)             ;; visual regexp steroid


;; Global key bindings

;; org mode
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-cc" 'org-capture)
;; smex
(define-key global-map "\C-ca" 'org-agenda)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ; This is the old M-x
;; visual-regexp
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
(define-key global-map (kbd "C-c m") 'vr/mc-mark)
(define-key esc-map (kbd "C-r") 'vr/isearch-backward) ; C-M-r
(define-key esc-map (kbd "C-s") 'vr/isearch-forward) ; C-M-r

;;; Global settings
(global-linum-mode 1) ; always show line numbers
(column-number-mode 1); show column numbers.
(load-theme 'tango-dark)
;; Parentheses highlighting
(setq show-paren-style 'parenthesis) ; highlight entire bracket expression
					; use Shift+arrow keys to move cursor around split panes
(windmove-default-keybindings)
;; when cursor is on edge, move to the other side, as in a toroidal space
(setq windmove-wrap-around nil)
;; Set maximum line width
(setq set-fill-column 80)
;; A period followed by one not two spaces as the end of a sentence.
(setq sentence-end-double-space nil)
;;; Pakcage settings
;; (require 'smex); Not needed if use package.el
;(smex-initialze); Can be omitted. This might cause a minimal delay when Smex is auto-initialized on its first run.
;; (require 'org-mode)
(setq org-default-notes-file (concat org-directory "/capture_notes.org"))
(setq org-agenda-files (list "~/org/index.org"
			     "~/org/capture_notes.org"))
(setq org-html-validation-link nil)
;; Enable dot for graphical visualization
;;(org-bable-do-load-languages
;; 'org-babel-load-languages
;; '((dot . t))) ; this line activates dot
;;;; require 'ox-publish)
;;; final Actions
(split-window-horizontally)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
