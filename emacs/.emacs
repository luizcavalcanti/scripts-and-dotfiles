;;;;;;;;;;;;;;;;;;;;;;
;; GENERAL SETTINGS ;;
;;;;;;;;;;;;;;;;;;;;;;

;; stop creating backup files
(setq make-backup-files nil)

;; remove menu bar
(menu-bar-mode -1)

;; use C-c C-d to duplicate line
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")

;; show line numbers
(global-linum-mode 1)
(setq linum-format "%4d  ")

;; display column number
(setq column-number-mode t)

;; use spaces for indenting
(setq-default indent-tabs-mode nil)

;; hide/disable welcome screen
(setq inhibit-startup-screen t)

;; set easier window navigation
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <left>") 'windmove-left)

;;;;;;;;;;;;;;;;;;;;;;;;;
;; COLOR/THEME OPTIONS ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tsdh-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:foreground "white"))))
 '(mode-line ((t (:background "#70d7ff" :foreground "#0a2d45"))))
 '(mode-line-inactive ((t (:background "white" :foreground "#0a2d45")))))

;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE MANAGEMENT ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("ELPA" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gun.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.
   Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     ;; (package-installed-p 'evil)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; make sure to have downloaded archive description.
;; Or use package-archive-contents as suggested by Nicolas Dudebout
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(ensure-package-installed 'gradle-mode
                          'magit
                          'groovy-mode)

;; activate installed packages
(package-initialize)

;;;;;;;;;;;
;; MODES ;;
;;;;;;;;;;;

;; C++ SETTINGS
(c-add-style "my-style"
             '("stroustrup"
               (indent-tabs-mode . nil)        ; use spaces rather than tabs
               (c-basic-offset . 4)            ; indent by four spaces
               (c-offsets-alist . ((inline-open . 0)  ; custom indentation rules
                                   (brace-list-open . 0)
                                   (statement-case-open . +)))))

(defun my-c++-mode-hook ()
  (c-set-style "my-style")        ; use my-style defined above
  (auto-fill-mode)
  (c-toggle-auto-hungry-state 1))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)
;;---------------------


;; EXTENSIONS/MODES SETTINGS
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.qml\\'" . qml-mode))
(add-to-list 'auto-mode-alist '("\\.gradle\\'" . groovy-mode))

;;;;;;;;;;;
;; GIT ;;
;;;;;;;;;;;

;; set magit help to git's man page
;;(setq magit-view-git-manual-method 'man)

;; Set Ctrl-x g for git status
;;(global-set-key (kbd "C-x g") 'magit-status)

;; enable git-gutter (displays changed lines)
;;(global-git-gutter-mode t)
;;(git-gutter:linum-setup)
