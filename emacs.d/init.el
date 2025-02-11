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
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(straight-use-package 'solarized-emacs)
(straight-use-package 'neotree)
(straight-use-package 'nyan-mode)
(straight-use-package 'projectile)
(straight-use-package 'helm)
(straight-use-package 'helm-projectile)
(straight-use-package 'markdown-mode)
(straight-use-package 'rainbow-delimiters)
(straight-use-package 'diminish)
(straight-use-package 'yaml-mode)
(straight-use-package 'company)
(straight-use-package 'all-the-icons)
(straight-use-package 'ruff-format)
(straight-use-package 'go-mode)
(straight-use-package 'glsl-mode)
(straight-use-package 'terraform-mode)
(straight-use-package 'sideline-flymake)
(straight-use-package 'eldoc-box)



;;;;;;;;;;;;;;;;;;;;
;; BASIC SETTINGS ;;
;;;;;;;;;;;;;;;;;;;;
;; stop creating backup files
(setq make-backup-files nil)

;; set auto-save of session
(desktop-save-mode 1)

;; set auto-pair mode for braces, quotes, etc
(electric-pair-mode 1)

;; remove GUI barsr
(menu-bar-mode -1)
(tool-bar-mode -1)

;; remove scroll bar
(scroll-bar-mode -1)

;; enable line numbers
(global-display-line-numbers-mode t)

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

;; Auto-reload changed files
(global-auto-revert-mode t)

;; Display tabs
;; (setq tab-bar-show t)
;;(global-tab-bar-mode t)
;; (global-tab-line-mode t)

;;;;;;;;;;;;;;;
;; SHORTCUTS ;;
;;;;;;;;;;;;;;;

;; neotree
;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
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
(global-set-key (kbd "s-k") 'kill-this-buffer)

;;;;;;;;;;;
;; MODES ;;
;;;;;;;;;;;

;; Enable emoji display everywhere
;; (add-hook 'after-init-hook 'global-emojify-mode)

;; Enable company mode everywhere
(add-hook 'after-init-hook 'global-company-mode)

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

;; Eglot
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'go-mode-hook 'eglot-ensure)
(add-hook 'python-mode-hook 'eglot-ensure)
(global-set-key (kbd "C-c r") #'eglot-rename)
(add-hook 'eldoc-mode-hook
          'eldoc-box-hover-mode)

;; Flymake
(setq sideline-flymake-display-mode 'line)
(setq sideline-backends-right '(sideline-flymake))
(add-hook 'flymake-mode-hook 'sideline-mode)

;; Python config
(setq ruff-format-command (concat (getenv "HOME") "/.local/bin/ruff"))

;; c/c++ config
(setq c-basic-offset 4)


;; golang config
(setq gofmt-command "/usr/local/go/bin/gofmt")


(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                   (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)


;;;;;;;;;;;;;;;;;;;;;;;;;
;; COLOR/THEME OPTIONS ;;
;;;;;;;;;;;;;;;;;;;;;;;;;
;; set color theme
;; (load-theme 'solarized-light t)
(load-theme 'solarized-dark t)

;; Cursor settings
(set-cursor-color "#FF6666")

;; Configure mode-line appearance
;; (set-face-attribute 'mode-line nil
                    ;; :box nil
                    ;; :foreground "#daddd5")

;; Fringe (spacing among buffers, line numbers, etc) appearance
;; (set-face-attribute 'fringe nil
                      ;; :foreground (face-foreground 'default)
                      ;; :background (face-background 'default))

;; set MacOS-specific font configuration
(when (my-system-type-is-darwin)
  (set-frame-font "Monaco 14")
  (set-face-attribute 'mode-line nil :font "Monaco"))

(when (my-system-type-is-gnu)
  (set-frame-font "Monaco 12")
  (set-face-attribute 'mode-line nil :font "Monaco"))

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
(diminish 'company-mode)
