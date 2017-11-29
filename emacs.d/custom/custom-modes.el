;;;;;;;;;;;
;; MODES ;;
;;;;;;;;;;;

;; Enable automatic braces pairing
(autopair-global-mode)

;; Enable projectile for all contexts
(projectile-global-mode)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)

;; Enable auto-complete
(require 'auto-complete-config)
(ac-config-default)
(setq ac-ignore-case nil)

;; settings for spacing
(setq web-mode-markup-indent-offset 2)
(setq js-indent-level 2)

;; Auto-complete modes
(add-to-list 'ac-modes 'ruby-electric-mode)

;; ruby-mode
(setq ruby-insert-encoding-magic-comment nil)

;; Linking file extensions to their default modes
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.qml\\'" . qml-mode))
(add-to-list 'auto-mode-alist '("\\.gradle\\'" . groovy-mode))
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.slim\\'" . slim-mode))
(add-to-list 'auto-mode-alist
             '("\\.\\(?:html\\|html\\|erb\\)\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.sass\\'" . sass-mode))
(add-to-list 'auto-mode-alist
             '("\\.\\(?:cap\\|gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
             '("\\(?:Brewfile\\|Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

;; C++ settings
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


;; Hooks for modes
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
;;(add-hook 'ruby-mode-hook 'ruby-electric-mode)
