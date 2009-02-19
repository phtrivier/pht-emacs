;; This tells emacs to use custom.el to
;; store customizations made through 'customize' interface
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
 
;; Meta-key to move things
(windmove-default-keybindings 'shift)

;; Color mode
(require 'color-theme)
(color-theme-clarity)

;; Dired-mode
(setq dired-mode-hook
      '(lambda ()
	 (define-key dired-mode-map "*" 'dired-up-directory)))