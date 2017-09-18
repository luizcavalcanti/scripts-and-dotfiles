;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE MANAGEMENT ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)

;; Add repos to archives list
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("ELPA" . "http://tromey.com/elpa/") t)
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

(ensure-package-installed 'autopair
                          'gradle-mode
                          'go-autocomplete
                          'go-mode
                          'markdown-mode
                          'powerline
                          'spaceline
                          'slim-mode
                          'web-mode
                          'scss-mode
                          'sass-mode
                          'dockerfile-mode
                          'docker-compose-mode)

;; activate installed packages
(package-initialize)
