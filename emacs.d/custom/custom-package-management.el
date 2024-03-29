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
(straight-use-package 'neotree)
(straight-use-package 'spaceline)
(straight-use-package 'nyan-mode)
(straight-use-package 'projectile)
(straight-use-package 'helm)
(straight-use-package 'helm-projectile)
(straight-use-package 'autopair)
(straight-use-package 'emojify)
(straight-use-package 'coffee-mode)
(straight-use-package 'markdown-mode)
;; (straight-use-package 'minimap)
(straight-use-package 'rainbow-delimiters)
(straight-use-package 'yaml-mode)
(straight-use-package 'solarized-emacs)
(straight-use-package 'rust-mode)
