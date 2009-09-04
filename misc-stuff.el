;; Uncomment to turn off the "beep" which sounded
;; everytime the top or bottom of a file was reached
;;(setq ring-bell-function 'ignore)

;; Windmove
(require 'windmove)               ; to load the package
(windmove-default-keybindings)

;; I like to be able to use "*" as a dired-up-directory
(add-hook 'dired-mode-hook
          (lambda () (define-key dired-mode-map "*" 'dired-up-directory)))

(provide 'misc-stuff)