;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE MANAGEMENT ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)

;; Add repos to archives list
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

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

(ensure-package-installed 'autopair
                          'gradle-mode
                          'go-mode
                          'markdown-mode
                          'powerline
                          'spaceline
                          'slim-mode
                          'web-mode
                          'scss-mode
                          'sass-mode
                          'dockerfile-mode
                          'docker-compose-mode
                          'nyan-mode
                          'neotree
                          'company
                          'helm
                          'helm-projectile
                          'rust-mode
                          'emojify)

;; activate installed packages
(package-initialize)
