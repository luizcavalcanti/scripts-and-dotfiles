;;;;;;;;;;;;;;;;;;;;;;
;; GENERAL SETTINGS ;;
;;;;;;;;;;;;;;;;;;;;;;

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flx-ido nyan-mode jsx-mode docker-compose-mode dockerfile-mode projectile sass-mode scss-mode web-mode slim-mode autopair markdown-mode powerline spaceline go-autocomplete go-mode gradle-mode))))
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

(add-to-list 'load-path "~/.emacs.d/custom")
(load "custom-package-management.el")
(load "custom-common.el")
(load "custom-theme.el")
(load "custom-modes")

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
