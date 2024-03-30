;;;;;;;;;;;;;;;;;;;;;;
;; GENERAL SETTINGS ;;
;;;;;;;;;;;;;;;;;;;;;;
(setq package-enable-at-startup nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ispell-dictionary nil))
;; '(coffee-tab-width 2)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Check if system is Darwin/macOS
(defun my-system-type-is-darwin ()
  "Return true if system is darwin-based (Mac OS X)"
  (string-equal system-type "darwin")
  )

;; Check if system is Microsoft Windows
(defun my-system-type-is-windows ()
 "Return true if system is Windows-based (at least up to Win7)"
 (string-equal system-type "windows-nt")
 )

;; Check if system is GNU/Linux
(defun my-system-type-is-gnu ()
  "Return true if system is GNU/Linux-based"
  (string-equal system-type "gnu/linux")
  )


;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE MANAGEMENT ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(straight-use-package 'solarized-emacs)
(straight-use-package 'material-theme)
(straight-use-package 'neotree)
(straight-use-package 'spaceline)
(straight-use-package 'nyan-mode)
(straight-use-package 'autopair)
(straight-use-package 'emojify)
(straight-use-package 'projectile)
(straight-use-package 'helm)
(straight-use-package 'helm-projectile)
;; (straight-use-package 'anaconda-mode)
;; (straight-use-package 'coffee-mode)
(straight-use-package 'markdown-mode)
;; (straight-use-package 'minimap)
(straight-use-package 'rainbow-delimiters)
(straight-use-package 'diminish)
;; (straight-use-package 'magit)
(straight-use-package 'yaml-mode)
;; (straight-use-package 'rust-mode)

;;;;;;;;;;;;;;;;;;;;
;; BASIC SETTINGS ;;
;;;;;;;;;;;;;;;;;;;;

;; stop creating backup files
(setq make-backup-files nil)

;; set auto-save of session
(desktop-save-mode 1)

;; remove GUI barsr
(menu-bar-mode -1)
(tool-bar-mode -1)

;; remove scroll bar
(scroll-bar-mode -1)

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

;; other shortcuts
(global-set-key (kbd "s-b") 'switch-to-buffer)
(global-set-key (kbd "s-;") 'comment-line)
(global-set-key (kbd "s-w") 'kill-this-buffer)


;;;;;;;;;;;;;;;;;;;;;;;;;
;; COLOR/THEME OPTIONS ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;; set color theme
;; (load-theme 'misterioso)
;; (load-theme 'solarized-light t)
(load-theme 'solarized-dark t)
;;(load-theme 'material)

(set-cursor-color "#FF6666")

;; Fringe (spacing among buffers, line numbers, etc) appearance
(set-face-attribute 'fringe nil
                      :foreground (face-foreground 'default)
                      :background (face-background 'default))

;; set MacOS-specific font configuration
(when (my-system-type-is-darwin)
  (set-frame-font "Monaco 14")
  (set-face-attribute 'mode-line nil :font "Monaco"))

(when (my-system-type-is-gnu)
  (set-frame-font "Monaco 12")
  (set-face-attribute 'mode-line nil :font "Monaco"))

;; load spaceline/poweline
(require 'spaceline-config)
(spaceline-spacemacs-theme)

;; load and configure nyan-mode
(require 'nyan-mode)
(setq nyan-wavy-trail t)
(setq nyan-bar-length 20)
(nyan-mode)
(nyan-start-animation)

;; Hide obvious minor modes
(diminish 'projectile-mode)
(diminish 'helm-mode)
(diminish 'autopair-mode)
(diminish 'eldoc-mode)
(diminish 'flymake-mode)

;; Configure mode-line appearance
(set-face-attribute 'mode-line nil
                    :box nil
                    :background "#6666ff"
                    :foreground "#daddd5"
                    :distant-foreground "#dddddd")
;;(set-face-attribute 'mode-line-inactive nil
;;                    :box t
;;                    :background "white"
;;                    :foreground "#0a2d45"
;;                    :distant-foreground "#dddddd")



;;;;;;;;;;;
;; MODES ;;
;;;;;;;;;;;

;; Enable emoji display everywhere
(add-hook 'after-init-hook 'global-emojify-mode)

;; Enable automatic braces pairing
(autopair-global-mode)

;; Enable projectile for all contexts
(projectile-global-mode)
(projectile-mode +1)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; ;; Enable helm
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(setq helm-split-window-in-side-p t)

;; ;; Projectile + Helm <3
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(global-set-key (kbd "s-F") #'helm-projectile-grep)
(global-set-key (kbd "s-t") #'helm-projectile-find-file)

;; Rainbow delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
;; (set-keyboard-coding-system 'utf-8)
