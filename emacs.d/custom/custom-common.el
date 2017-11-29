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

;; use C-c C-d to duplicate line
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")

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

;; set easier window navigation with C-c + arrows
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <left>") 'windmove-left)

;; set copy and paste from clipboard
(setq x-select-enable-clipboard t)

;; smooth scrolling
(setq scroll-step 1 scroll-conservatively 10000)
