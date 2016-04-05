(require 'package)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/haskell-mode/")
(load "editorconfig")

(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list "/usr/share/emacs/site-lisp/haskell-mode/")

;; Easier file and buffer switching using ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-ignore-extenstions t)
(setq completion-ignored-extensions '(".mp3" ".hi" ".beam"))

;;ess
(setq load-path (cons "/usr/share/emacs/site-lisp/ess" load-path))
(require 'ess-site)

;;word-count
(autoload 'word-count-mode "word-count"
          "Minor mode to count words." t nil)
(global-set-key "\M-+" 'word-count-mode)

;;auctex
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
;enable document parsing
(setq TeX-auto-save t)
(setq TeX-parse-self t)
;for multi-file structure using include
(setq-default TeX-master nil)

;;magit
(autoload 'magit-status "magit" nil t)
(global-set-key (kbd "C-c C-g") `magit-status)

;;paren
(show-paren-mode 1)

;;reftex
(require 'reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

;;spelling
(add-hook 'LaTeX-mode-hook (lambda () (flyspell-mode 1)))

;;commenting
(global-set-key (kbd "C-x C-k") `comment-or-uncomment-region)

;;(add-to-list 'package-archives
;;             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;email
(add-to-list 'auto-mode-alist '("/sup.*eml$" . message-mode))
(add-hook 'message-mode-hook (lambda ()
  (auto-fill-mode 1)
  (flyspell-mode 1)
  (search-forward-regexp "^$")))

;;time
 (defface egoge-display-time
   '((((type x w32 mac))
      ;; #060525 is the background colour of my default face.
      (:foreground "#060525" :inherit bold))
     (((type tty))
      (:foreground "blue")))
   "Face used to display the time in the mode line.")

 ;; This causes the current time in the mode line to be displayed in
 ;; `egoge-display-time-face' to make it stand out visually.
 (setq display-time-string-forms
       '((propertize (concat " " 24-hours ":" minutes " ")
                     'face 'egoge-display-time)))

(display-time-mode 1)

;;other
(require 'tramp)
(require 'org)
(require 'color-theme)
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized/")
(load-theme 'tango-dark t)

(menu-bar-mode 1)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setq hl-line-mode t)


(defun frame-bck()
  (interactive)
  (other-window -1)
)
(define-key (current-global-map) (kbd "M-o") 'other-window)
(define-key (current-global-map) (kbd "M-O") 'frame-bck)

;;org capture
;(setq org-default-notes-file (concat org-directory "/notes.org"))
;(define-key global-map "\C-cc" ’org-capture)

;;scratch

(setq initial-major-mode 'text-mode)
(setq initial-scratch-message nil)

;;spaces for indent

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)

;;php

(require 'php-mode)
(setq c-default-style "linux" c-basic-offset 4)

;;erlang
(setq load-path (cons  "/usr/lib/erlang/lib/tools-2.8.1/emacs"
    load-path))
(setq erlang-root-dir "/usr/lib/erlang")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
(require 'erlang-start)

;;haskell

(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(speedbar-add-supported-extension ".hs")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(frame-background-mode (quote light))
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("~/Desktop/TODO.org")))
 '(org-babel-load-languages (quote ((emacs-lisp . t) (R . t))))
 '(org-format-latex-options
   (quote
    (:foreground default :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(org-log-done (quote time))
 '(org-log-into-drawer t)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(package-archives
   (quote
    (("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(tool-bar-mode nil))

(require 'haskell-interactive-mode)
(define-key haskell-mode-map (kbd "M-.") 'haskell-mode-tag-find)

;;org

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-hook 'org-mode-hook 'auto-fill-mode)
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'text-mode-hook 'auto-fill-mode)


(global-set-key (kbd "<f12>")  'save-some-buffers)

(blink-cursor-mode 0)

(global-set-key "\C-l" `goto-line)

(setq tramp-default-method "scp")
(setq tramp-default-user "narens")

(setq tramp-default-host "localhost")

(setq column-number-mode t)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq-default ispell-program-name "aspell")


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "unknown" :slant normal :weight normal :height 110 :width normal)))))
