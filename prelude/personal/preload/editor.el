(global-hl-line-mode t)
(global-linum-mode 1)

(setq c-basic-offset 4) ; indents 4 chars
(setq tab-width 4) ; and 4 char wide for TAB
(setq indent-tabs-mode nil) ; And force use of spaces
;(turn-on-font-lock)       ; same as syntax on in Vim
;(setq width (max width (+ (length str) 1)))   ; ??? line numbers
;(setq width (max width (length str)))
;(setq linum-format "%4d \u2502 ")
;(setq linum-format "%d")

;(setq linum-highlight-in-all-buffersp t)
;(hlinum-activate)
;(setq linum-highlight-face "white")

(set-face-background 'hl-line "#002b36")
(set-face-foreground 'hl-line "dark orange")
(set-face-foreground 'highlight nil)

(setq-default cursor-type 'bar) ;;www.gnu.org/software/emacs/manual/html_node/elisp/Cursor-Parameters.html
(setq-default cursor-color "darkGrey")

(show-paren-mode -1)

(provide 'editor)
;;; editor.el ends here
