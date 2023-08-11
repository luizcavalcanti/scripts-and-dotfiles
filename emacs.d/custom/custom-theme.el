;;;;;;;;;;;;;;;;;;;;;;;;;
;; COLOR/THEME OPTIONS ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;; set color theme
;; (load-theme 'misterioso)
(load-theme 'solarized-light t)

(set-cursor-color "#FF6666")

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
  (set-frame-font "Monaco 14")
  (set-face-attribute 'mode-line nil :font "Monaco"))

(when (my-system-type-is-gnu)
  (set-frame-font "Monaco 10")
  (set-face-attribute 'mode-line nil :font "Monaco"))

;; load spaceline/poweline
(require 'spaceline-config)
(spaceline-emacs-theme)

;; load and configure nyan-mode
(require 'nyan-mode)
(setq nyan-wavy-trail t)
(setq nyan-bar-length 20)
(nyan-mode)
(nyan-start-animation)
