(global-hl-line-mode t)
(global-linum-mode 1)

(setq c-basic-offset 2) ; indents 4 chars
(setq tab-width 2)          ; and 4 char wide for TAB
(setq indent-tabs-mode nil) ; And force use of spaces
;(turn-on-font-lock)       ; same as syntax on in Vim
;(setq width (max width (+ (length str) 1)))   ; ??? line numbers
;(setq width (max width (length str)))
;(setq linum-format "%4d \u2502 ")
;(setq linum-format "%d")

;(setq linum-highlight-in-all-buffersp t)
;(hlinum-activate)
;(setq linum-highlight-face "white")

(set-face-background 'hl-line "dark slate blue")
(set-face-foreground 'hl-line "dark slate green")
(set-face-foreground 'highlight nil)