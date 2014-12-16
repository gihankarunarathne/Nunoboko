;; -*- mode: emacs-lisp -*-
;; Comment:
;; Simple .emacs configuration

;; ---------------------
;; -- Global Settings --
;; ---------------------
;;; Code:
; Set global PATH
;(setenv "PATH" (concat (getenv "PATH") ":/home/gihan/.emacs.d/vendor/web-beautify/node_modules/bin"))
(setq exec-path (append exec-path '("~/.emacs.d/vendor/web-beautify/node_modules/bin")))
;(setq exec-path (append exec-path '("/opt/node/bin")))
;(error (getenv "PATH"))

(add-to-list 'load-path "~/.emacs.d/startup")  ; This may not be appeared if you have already added.
(require 'cl)
(require 'ido)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
;; (require 'linum)
(require 'hlinum)
(require 'smooth-scrolling)
(require 'whitespace)
(require 'dired-x)
(require 'compile)
(ido-mode t)
(menu-bar-mode t)
(normal-erase-is-backspace-mode 1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq column-number-mode t)
;(setq inhibit-startup-message t)F ;; Disable Welcome screen
(setq save-abbrevs nil)
(setq show-trailing-whitespace t)
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t)

(hlinum-activate)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;'(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 ;'(custom-enabled-themes (quote (tango-2)))
 ;'(ede-project-directories (quote ("/home/gihan/alpigc/omi")))
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 '(default ((t (:inherit autoface-default :strike-through nil :underline nil :slant normal :weight normal :height 120 :width normal :family "monaco"))))
 '(column-marker-1 ((t (:background "red"))))
 '(diff-added ((t (:foreground "cyan"))))
 '(flymake-errline ((((class color) (background light)) (:background "Red"))))
 '(font-lock-comment-face ((((class color) (min-colors 8) (background light)) (:foreground "red"))))
 '(fundamental-mode-default ((t (:inherit default))))
 '(highlight ((((class color) (min-colors 8)) (:background "dark slate blue" :foreground "green"))))
 '(isearch ((((class color) (min-colors 8)) (:background "yellow" :foreground "black"))))
 ;'(linum ((t (:foreground "dark gray" :weight bold))))
 ;'(linum ((t (:foreground "black" :weight bold))))
 '(region ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
 '(secondary-selection ((((class color) (min-colors 8)) (:background "gray" :foreground "cyan"))))
 ;; '(show-paren-match ((((class color) (background black)) (:background "#073642" :weight "extra-bold"))))
 '(show-paren-match ((t (:background "dark green" :weight bold))))
 '(vertical-border ((t nil)))

)

;; ------------
;; -- Macros --
;; ------------
(load "defuns-config.el")
(fset 'align-equals "\C-[xalign-regex\C-m=\C-m")
(global-set-key "\M-=" 'align-equals)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c;" 'comment-or-uncomment-region)
(global-set-key "\M-n" 'next5)
(global-set-key "\M-p" 'prev5)
(global-set-key "\M-o" 'other-window)
(global-set-key "\M-i" 'back-window)
(global-set-key "\C-z" 'zap-to-char)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\M-d" 'delete-word)
(global-set-key "\M-h" 'backward-delete-word)
(global-set-key "\M-u" 'zap-to-char)
(global-set-key "\C-c\C-d\c" 'desktop-change-dir)

;; ---------------------------
;; -- JS Mode configuration --
;; ---------------------------
(load "js-config.el")
(add-to-list 'load-path "~/.emacs.d/startup/jade-mode") ;; github.com/brianc/jade-mode
(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))



;; ---------------------------
;; -- Auto Complete startup --
;; ---------------------------
(add-to-list 'load-path "~/.emacs.d/auto-complete/")
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")

;; ----------------------------
;; -- el-get package manager --
;; ----------------------------
;; Setup el-get https://github.com/dimitri/el-get#setup
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;; Load Prelude
(load "~/.emacs.d/prelude/init.el")
; guide (define-key global-map (kbd "s-r") 'recentf-open-files)
(define-key global-map (kbd "s-d") 'projectile-find-dir)
(define-key global-map (kbd "s-p") 'projectile-switch-project)
(define-key global-map (kbd "s-f") 'projectile-find-file)
(define-key global-map (kbd "s-g") 'projectile-grep)
(define-key global-map (kbd "s-w") 'desktop-change-dir)
(define-key global-map (kbd "s-e") 'projectile-recentf)
(define-key global-map (kbd "s-b") 'prelude-switch-to-previous-buffer)
;(define-key projectile-mode-map [?\s-d] 'projectile-find-dir)
;(define-key projectile-mode-map [?\s-p] 'projectile-switch-project)
;(define-key projectile-mode-map [?\s-f] 'projectile-find-file)
;(define-key projectile-mode-map [?\s-g] 'projectile-grep)

;; Move between Windows (cursor) -- like Terminator
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(define-key global-map (kbd "s-<up>") 'windmove-up)
(define-key global-map (kbd "s-<down>") 'windmove-down)
;; Transpose two buffers
(defun transpose-buffers (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
            (next-win (window-buffer (funcall selector))))
        (set-window-buffer (selected-window) next-win)
        (set-window-buffer (funcall selector) this-win)
        (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg)))))) ;-- end transpose

;; Save desktop
(desktop-save-mode 1)

;; Color theme - http://ergoemacs.org/emacs/emacs_playing_with_color_theme.html
;; List of default themes

;(load-theme 'adwaita)
;(load-theme 'deeper-blue)
;(load-theme 'dichromacy)
;(load-theme 'light-blue)
;(load-theme 'manoj-dark)
;(load-theme 'misterioso)
;(load-theme 'tango)
(load-theme 'tango-dark)
;(load-theme 'tsdh-dark)
;(load-theme 'tsdh-light)
;(load-theme 'wheatgrass)
;(load-theme 'whiteboard)
;(load-theme 'wombat)

;; Install custom theme - 1. install it via melpa 2. set in following
;(package-initialize)
;(require 'color-theme)
;(setq color-theme-is-global t)
;(color-theme-initialize)
;(color-theme-classic)

;; Tern - JS code analyzer (http://ternjs.net/doc/manual.html#emacs)
(add-to-list 'load-path "~/.emacs.d/vendor/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js-mode-hook (lambda () (tern-mode t))) ;; Optional: Enable tern-mode on JS files

;; Enable Auto completing with Tern
;(eval-after-load 'tern
;  '(progn
;     (require 'tern-auto-complete)
;     (tern-ac-setup))) */

;; web-beautify
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

(show-paren-mode 1)

;;; init.el ends here
