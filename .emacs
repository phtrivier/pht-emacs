;; This tells emacs to use custom.el to
;; store customizations made through 'customize' interface
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
 
;; Meta-key to move things
(windmove-default-keybindings 'shift)

;; Color mode
(require 'color-theme)
(color-theme-clarity)