;; ;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; PACKAGE MANAGEMENT ;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;
;; (defvar bootstrap-version)
;; (let ((bootstrap-file
;;        (expand-file-name
;;         "straight/repos/straight.el/bootstrap.el"
;;         (or (bound-and-true-p straight-base-dir)
;;             user-emacs-directory)))
;;       (bootstrap-version 7))
;;   (unless (file-exists-p bootstrap-file)
;;     (with-current-buffer
;;         (url-retrieve-synchronously
;;          "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
;;          'silent 'inhibit-cookies)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp)))
;;   (load bootstrap-file nil 'nomessage))

;; (straight-use-package 'use-package)
;; (straight-use-package 'solarized-emacs)
;; (straight-use-package 'neotree)
;; (straight-use-package 'nyan-mode)
;; (straight-use-package 'projectile)
;; (straight-use-package 'helm)
;; (straight-use-package 'helm-projectile)
;; (straight-use-package 'markdown-mode)
;; (straight-use-package 'rainbow-delimiters)
;; (straight-use-package 'diminish)
;; (straight-use-package 'yaml-mode)
;; (straight-use-package 'company)
;; (straight-use-package 'all-the-icons)
;; (straight-use-package 'ruff-format)
;; (straight-use-package 'go-mode)
;; (straight-use-package 'glsl-mode)
;; (straight-use-package 'terraform-mode)
;; (straight-use-package 'typescript-mode)
;; (straight-use-package 'sideline-flymake)
;; (straight-use-package 'eldoc-box)
;; (straight-use-package 'zenburn-theme)



;; ;;;;;;;;;;;
;; ;; MODES ;;
;; ;;;;;;;;;;;

;; ;; Enable emoji display everywhere
;; ;; (add-hook 'after-init-hook 'global-emojify-mode)

;; ;; Enable company mode everywhere
;; (add-hook 'after-init-hook 'global-company-mode)
;; ;; (add-hook 'after-init-hook 'corfu-mode)

;; ;; Enable projectile for all contexts
;; (projectile-global-mode)
;; (projectile-mode +1)
;; (setq projectile-indexing-method 'alien)
;; (setq projectile-enable-caching t)
;; (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; ;; ;; Enable helm
;; (helm-mode 1)
;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "C-c h") 'helm-command-prefix)
;; (global-unset-key (kbd "C-x c"))
;; (setq helm-split-window-in-side-p t)

;; ;; ;; Projectile + Helm <3
;; (setq projectile-completion-system 'helm)
;; (helm-projectile-on)
;; (global-set-key (kbd "s-F") #'helm-projectile-grep)
;; (global-set-key (kbd "s-t") #'helm-projectile-find-file)

;; ;; Rainbow delimiters
;; (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; ;; Eglot
;; (add-hook 'c-mode-hook 'eglot-ensure)
;; (add-hook 'c++-mode-hook 'eglot-ensure)
;; (add-hook 'go-mode-hook 'eglot-ensure)
;; (add-hook 'python-mode-hook 'eglot-ensure)
;; (global-set-key (kbd "C-c r") #'eglot-rename)
;; (global-set-key (kbd "C-c a") #'eglot-code-actions)
;; (add-hook 'eldoc-mode-hook
;;           'eldoc-box-hover-mode)

;; ;; Flymake
;; (setq sideline-flymake-display-mode 'line)
;; (setq sideline-backends-right '(sideline-flymake))
;; (add-hook 'flymake-mode-hook 'sideline-mode)

;; ;; Python config
;; (setq ruff-format-command "/snap/bin/ruff")

;; ;; Javascript config
;; (setq js-indent-level 2)

;; ;; c/c++ config
;; (setq c-basic-offset 4)


;; ;; golang config
;; (setq gofmt-command "/usr/local/go/bin/gofmt")
;; (add-to-list 'exec-path "~/workspace/go/bin")

;; (defun efs/display-startup-time ()
;;   (message "Emacs loaded in %s with %d garbage collections."
;;            (format "%.2f seconds"
;;                    (float-time
;;                    (time-subtract after-init-time before-init-time)))
;;            gcs-done))

;; (add-hook 'emacs-startup-hook #'efs/display-startup-time)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; COLOR/THEME OPTIONS ;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; set color theme
;; ;; (load-theme 'solarized-light t)
;; ;; (load-theme 'solarized-dark t)
;; (load-theme 'zenburn t)

;; ;; Cursor settings
;; (set-cursor-color "#FF6666")

;; ;; set MacOS-specific font configuration
;; (when (my-system-type-is-darwin)
;;   (set-frame-font "Monaco 15")
;;   (set-face-attribute 'mode-line nil :font "Monaco"))

;; (when (my-system-type-is-gnu)
;;   (set-frame-font "Monaco 12")
;;   (set-face-attribute 'mode-line nil :font "Monaco"))

;; ;; load and configure nyan-mode
;; (require 'nyan-mode)
;; (setq nyan-wavy-trail t)
;; (setq nyan-bar-length 20)
;; (nyan-mode)
;; (nyan-start-animation)

;; ;; Hide obvious minor modes
;; (diminish 'projectile-mode)
;; (diminish 'helm-mode)
;; (diminish 'autopair-mode)
;; (diminish 'eldoc-mode)
;; (diminish 'eldoc-box-hover-mode)
;; (diminish 'flymake-mode)
;; (diminish 'company-mode)
;; (diminish 'sideline-mode)
;; (put 'upcase-region 'disabled nil)


;; ;; Google C style
;; (add-to-list 'load-path "~/.emacs.d/google-c-style.el")

;;;;;;;;;;;;;;;;;;;;;;;;
;; Package management ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(unless (package-installed-p 'use-package) (package-install 'use-package)) ; install use-package with package.el
(require 'use-package-ensure)                                              ; ensure that it installs automatically
(setq use-package-always-ensure t)
(require 'use-package)                                                     ; load use-package at Emacs startup

;;;;;;;;;;;;;;;;
;; Appearance ;;
;;;;;;;;;;;;;;;;

;; Font config
(set-frame-font "Monaco 11")
(set-face-attribute 'default nil :font "Monaco")
(set-face-attribute 'mode-line nil :font "Monaco")
(set-face-attribute 'variable-pitch nil :font "Monaco")
(set-face-attribute 'fixed-pitch nil :font "Monaco")
(add-to-list 'default-frame-alist '(font . "Monaco 11"))
(set-face-attribute 'font-lock-comment-face nil :slant 'italic)
(set-face-attribute 'font-lock-function-name-face nil :slant 'italic)
(set-face-attribute 'font-lock-variable-name-face nil :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil :slant 'italic)


;; Theme
(use-package atom-one-dark-theme
  :init
  (load-theme 'atom-one-dark t))


;; General looks
(setq inhibit-startup-screen t) ; disable startup screen
(setq inhibit-splash-screen t) ; disable startup screen
(setq initial-scratch-message nil) ; clean up scratch buffer message
(menu-bar-mode -1)             ; disable the menu bar below the application window
(tool-bar-mode -1)             ; disable the Emacs tool bar
(scroll-bar-mode -1)           ; disable the scroll bar
(global-visual-line-mode t)    ; disable visual line mode
(buffer-face-mode 1)           ; so that different fonts can be used on different buffers if needed
(global-display-line-numbers-mode t) ; show line numbers
(setq visible-bell 1) ; disable warning sound, make it visible
(setq scroll-step 1 scroll-conservatively 10000) ; smooth scrolling

;; ;; Display tabs
;; ;; (setq tab-bar-show t)
;; ;;(global-tab-bar-mode t)
;; ;; (global-tab-line-mode t)


;;;;;;;;;;;;;
;; Editing ;;
;;;;;;;;;;;;;
(setq make-backup-files nil) ; stop creating backup files
(desktop-save-mode 1) ; set auto-save of session
(auto-save-mode nil) ; don't auto save files by default
(setq auto-save-default nil) ; set the default file location of auto-saved files to NIL
;; (setq initial-buffer-choice (lambda() (get-buffer "*scratch*"))) ; set initial buffer on emacs initialization
(setq use-short-answers t) ; yes/no questions in the minibuffer can be answered using y/n
(setq-default tab-width 4) ; make default tab spacing 4
(delete-selection-mode 1) ; select text and automatically overwrite without typing backspace
(setq browse-url-generic-program "xdg-open") ; open URLs in the default web browser (not EWW) using XDG's util
(global-auto-revert-mode t) ; auto-reload changed files
(setq-default indent-tabs-mode nil) ; use spaces for indenting
(setq select-enable-clipboard t) ; set copy and paste from clipboard



;; ;;;;;;;;;;;;;;;
;; ;; SHORTCUTS ;;
;; ;;;;;;;;;;;;;;;

;; treemacs
(global-set-key [f8] 'treemacs)

;; use C-c C-d to duplicate line
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")

;; set easier window navigation with C-c + arrows
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <left>") 'windmove-left)

;; other shortcuts
(global-set-key (kbd "s-b") 'switch-to-buffer)
(global-set-key (kbd "s-/") 'comment-line)
(global-set-key (kbd "s-k") 'kill-current-buffer)


(use-package doom-modeline
  :init
  (doom-modeline-mode 1)

  :config
  (setq doom-modeline-icon t
  doom-modeline-major-mode-icon t
  doom-modeline-major-mode-color-icon t
  doom-modeline-enable-word-count t
  doom-modeline-buffer-encoding t
  doom-modeline-persp-icon t
  doom-modeline-modal-modern-icon nil
  doom-modeline-persp-name t
  doom-modeline-height 25))

(use-package all-the-icons
  :if (display-graphic-p))
(use-package all-the-icons-completion
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init
  (all-the-icons-completion-mode))

(use-package ag
  :ensure t)

(use-package vertico
  :init
  (vertico-mode 1)
  :hook
  (rfn-eshadow-update-overlay . vertico-directory-tidy) ; when a directory's name is incomplete, delete the name completely in Vertico
  :bind
  (:map vertico-map
  ("RET" . vertico-directory-enter)           ; make Return enter directories
  ("DEL" . vertico-directory-delete-char)     ; make Delete delete characters as well
  ("M-DEL" . vertico-directory-delete-word))  ; delete words easily
  :config
  (setq vertico-count 12)
  (setq completion-styles '(flex))
  (setq completion-category-overrides '((file (styles . (partial-completion))))))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion))))
  (completion-category-defaults nil)) ;; Disable defaults, use vertico settings

(use-package marginalia
  :after vertico
  :config
  (marginalia-mode +1))

(use-package which-key
  :ensure t
  :config
  (which-key-mode +1))

;; Projectile
(use-package projectile
  :ensure t
  :init
  (setq projectile-project-search-path '("~/workspace"))
  :config
  ;; I typically use this keymap prefix on macOS
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  ;; On Linux, however, I usually go with another one
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
  (global-set-key (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(customize-set-variable 'projectile-auto-cleanup-known-projects t)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(global-set-key (kbd "s-F") #'projectile-ag)
(global-set-key (kbd "s-t") #'projectile-find-file)

;; Eglot
(use-package eldoc-box)

(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'go-mode-hook 'eglot-ensure)
(add-hook 'python-mode-hook 'eglot-ensure)
(global-set-key (kbd "C-c r") #'eglot-rename)
(global-set-key (kbd "C-c a") #'eglot-code-actions)
(add-hook 'eldoc-mode-hook
          'eldoc-box-hover-mode)

(use-package flycheck
  :init
  (global-flycheck-mode))

(use-package flycheck-posframe
  :ensure t
  :after flycheck
  :config (add-hook 'flycheck-mode-hook #'flycheck-posframe-mode))

(use-package company
  :hook
  (prog-mode . global-company-mode)
  (prog-mode . company-tng-mode)
  (prog-mode . electric-pair-mode)
  (org-src-mode . company-mode)

  :config
  (setq company-idle-delay 0
        company-minimum-prefix-length 2)

  :custom
  (custom-set-faces
   '(company-tooltip ((t (:background "#3e4452"))))
   '(company-tooltip-selection ((t (:background "#454c59"))))
   '(company-tooltip-common ((t (:background "#3e4452"))))
   '(company-scrollbar-bg ((t (:background "#282c34"))))))

;; (use-package lsp-mode
;;   :defer t
;;   :hook (python-mode . lsp)
;;   :hook (c-mode . lsp)
;;   :hook (c++-mode . lsp)
;;   :hook (rust-mode . lsp)
;;   :hook (ess-mode . lsp)
;;   :hook (go-mode . lsp)
;;   :config
;;   (setq lsp-auto-guess-root t)
;;   (defvar lsp-modeline-code-actions-segments '(count icon name)))

;; (use-package lsp-ui
;;   :commands lsp-ui-mode
;;   :custom
;;   (custom-set-faces
;;    '(lsp-ui-doc-header ((t :foreground "#abb2bf" :background "#454c59"))))

;;   :config
;;   (setq lsp-ui-doc-header t)
;;   (setq lsp-ui-doc-include-signature t)
;;   (setq lsp-ui-doc-border "#e06c75")
;;   (setq lsp-ui-doc-show-with-cursor t)
;;   (setq lsp-ui-doc-position 'at-point)
;;   (setq lsp-ui-sideline-show-symbol t))

(use-package treemacs
  :init
  (treemacs-project-follow-mode)
  :config
  (defvar treemacs--project-follow-delay 0.2))
;; (use-package lsp-treemacs)

(use-package rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Enable emoji display everywhere
(use-package emojify)
(add-hook 'after-init-hook 'global-emojify-mode)


;; (use-package tree-sitter-langs)
;; (use-package tree-sitter
;;   :hook
;;   (tree-sitter-mode . tree-sitter-hl-mode)
;;   (python-mode . tree-sitter-mode)
;;   (sh-mode . tree-sitter-mode))

;; (use-package diff-hl
;;   :init
;;   (global-diff-hl-mode 1)
;;   (diff-hl-flydiff-mode)

;;   :custom
;;   (custom-set-faces
;;    '(diff-hl-change ((t (:background "#61afef"))))
;;    '(diff-hl-insert ((t (:background "#97c277"))))
;;    '(diff-hl-delete ((t (:background "#e06c75")))))

;;   :hook
;;   (prog-mode . diff-hl-mode)
;;   (magit-pre-refresh . diff-hl-magit-pre-refresh)
;;   (magit-post-refresh . diff-hl-magit-post-refresh))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(flycheck-posframe flycheck emojify rainbow-delimiters treemacs company eldoc-box projectile which-key marginalia orderless vertico ag all-the-icons-completion all-the-icons doom-modeline atom-one-dark-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
