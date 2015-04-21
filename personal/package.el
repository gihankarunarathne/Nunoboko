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
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)
;(define-key global-map (kbd "s-<up>") 'windmove-up)
;(define-key global-map (kbd "s-<down>") 'windmove-down)
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
;(load-theme 'tango-dark)
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

;; Configure el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;; Go lang mode install (Ref: http://tleyden.github.io/blog/2014/05/22/configure-emacs-as-a-go-editor-from-scratch/)
(add-to-list 'load-path "~/.emacs.d/vendor/go-mode/")
(require 'go-mode-autoloads)

(setenv "PATH" "/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/go/bin")
(setenv "GOROOT" "/opt/go")
(setenv "GOPATH" "/home/gihan/go")

;; gofmt call on save
(setq exec-path (cons "/opt/go/bin" exec-path))
(add-to-list 'exec-path "/home/gihan/go/bin")
;; Add hook to only for GO (Ref: https://groups.google.com/forum/#!topic/golang-nuts/c176nKcyoDQ)
(add-hook 'go-mode-hook 
  (lambda ()
    (add-hook 'before-save-hook 'gofmt-before-save)
    (setq-default) 
    (setq tab-width 2) 
    (setq standard-indent 2) 
    (setq indent-tabs-mode nil)))

;; GO land auto-complete (Ref: https://github.com/nsf/gocode)
(add-to-list 'load-path "~/.emacs.d/vendor/go-autocomplete/emacs/")
(require 'go-autocomplete)
(require 'auto-complete-config)
