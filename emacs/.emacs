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
 '(mode-line ((t (:background "#0087af" :foreground "white"))))
 '(mode-line-inactive ((t (:background "#202020" :foreground "white")))))

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
