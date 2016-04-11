(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'blackboard t)

(add-to-list 'load-path "~/.emacs.d/vendor/startup/")
(require 'hlinum)
(require 'smooth-scrolling)
(require 'whitespace)
(require 'nodejs-repl)
(setq column-number-mode t)
(hlinum-activate)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-hl-line-mode t)
(global-linum-mode 1)

;; web-beautify
(setq exec-path (append exec-path '("~/.emacs.d/vendor/web-beautify/node_modules/bin")))

;(add-to-list 'load-path "/opt/node/bin/js-beautify")
(add-to-list 'load-path "~/.emacs.d/vendor/web-beautify/")
;; Basic Setup
(require 'web-beautify) ;; Not necessary if using ELPA package
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
(eval-after-load 'js
  '(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'json-mode
  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'sgml-mode
  '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))

(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

;; Added smart mode line (Ref: https://github.com/Bruce-Connor/smart-mode-line)
(sml/setup)
; (sml/apply-theme 'powerline)
(sml/apply-theme 'dark)
; (sml/apply-theme 'light)
; (sml/apply-theme 'respectful)
; (sml/apply-theme 'automatic)


;; make indentation commands use space only (never tab character)
(setq-default indent-tabs-mode nil) ; emacs 23.1, 24.2, default to t

;; set default tab char's display width to 4 spaces
; (setq-default tab-width 2) ; emacs 23.1, 24.2, default to 8

;; set current buffer's tab char's display width to 4 spaces
(setq tab-width 2)

;; Force set JavaScript indent size 
;; (wkorks:: M-x customize -> languages -> js2 mode -> change indentation)
;; http://stackoverflow.com/questions/4177929/how-to-change-the-indentation-width-in-emacs-javascript-mode
; (setq js-indent-level 2)