;;;;;;;;;;;
;; MODES ;;
;;;;;;;;;;;
;; Enable emoji display everywhere
(add-hook 'after-init-hook #'global-emojify-mode)

;; Enable projectile for all contexts
(projectile-global-mode)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)

;; Enable helm
(require 'helm-config)
(helm-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(setq helm-split-window-in-side-p t)


;; Projectile + Helm <3
(setq projectile-completion-system 'helm)
(helm-projectile-on)


;; Enable automatic braces pairing
(autopair-global-mode)

;; settings for spacing
(setq web-mode-markup-indent-offsext 2)
(setq js-indent-level 2)

;; rust-mode and cargo-minor-mode
(setq rust-format-on-save t)
(setq rust-rustfmt-bin "~/.cargo/bin/rustfmt")
(add-hook 'rust-mode-hook 'cargo-minor-mode)

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
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

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
(add-hook 'after-init-hook 'global-company-mode)
