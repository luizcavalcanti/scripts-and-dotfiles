;;;;;;;;;;;;;;;;;;;;;;;;;
;; COLOR/THEME OPTIONS ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;; set color theme
(load-theme 'tsdh-dark)

(set-cursor-color "#FF6666")

;; Line number bar appearance
(set-face-attribute 'linum nil :foreground "white")

;; Fringe (spacing among buffers, line numbers, etc) appearance
(set-face-attribute 'fringe nil
                      :foreground (face-foreground 'default)
                      :background (face-background 'default))

;; Configure mode-line appearance
(set-face-attribute 'mode-line nil
                    :box nil
                    :background "#70d7ff"
                    :foreground "#0a2d45"
                    :distant-foreground "#dddddd")
(set-face-attribute 'mode-line-inactive nil
                    :box t
                    :background "white"
                    :foreground "#0a2d45"
                    :distant-foreground "#dddddd")

;; set MacOS-specific font configuration
(when (my-system-type-is-darwin)
  (set-default-font "Monaco 12")
  (set-face-attribute 'mode-line nil :font "Monaco"))

;; load spaceline/poweline
(require 'spaceline-config)
(spaceline-emacs-theme)
