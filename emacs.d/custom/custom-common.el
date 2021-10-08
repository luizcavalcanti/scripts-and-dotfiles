;; stop creating backup files
(setq make-backup-files nil)

;; set auto-save of session
(desktop-save-mode 1)

;; remove menu bar
(menu-bar-mode -1)

;; remove tool bar
(tool-bar-mode -1)

;; remove scroll bar
(scroll-bar-mode -1)

;; show line numbers
(global-linum-mode 1)
(setq linum-format "%4d  ")

;; display column number
(setq column-number-mode t)

;; use spaces for indenting
(setq-default indent-tabs-mode nil)

;; set tab witdh to 4 chars
(setq-default tab-width 4)

;; hide/disable welcome screen
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)

;; set copy and paste from clipboard
(setq x-select-enable-clipboard t)

;; smooth scrolling
(setq scroll-step 1 scroll-conservatively 10000)

;; Disable warning sound, make it visible
(setq visible-bell 1)

;;;;;;;;;;;;;;;
;; SHORTCUTS ;;
;;;;;;;;;;;;;;;

;; neotree toggle
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; use C-c C-d to duplicate line
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")

;; set easier window navigation with C-c + arrows
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <left>") 'windmove-left)
