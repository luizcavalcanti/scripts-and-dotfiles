; VARS
(custom-set-variables
 '(inhibit-startup-screen t)
 '(custom-enabled-themes (quote (wombat)))
)
(custom-set-faces
)

 
;; GENERAL SETTINGS
(setq-default indent-tabs-mode nil)
;;--------------------


;; PYTHON SETTINGS
(require 'package)
(add-to-list 'package-archives
 '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(package-initialize)
(elpy-enable)
;; (elpy-clean-modeline)

;; QT/QML SETTINGS
(add-to-list 'load-path (expand-file-name "~/elisp/"))
(require 'qml-mode)
;;--------------------


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
