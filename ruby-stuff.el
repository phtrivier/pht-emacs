(add-load-path-dir "ruby-stuff")
;;(add-to-list 'load-path (expand-file-name (concat pht-lisp-dir "/ruby-stuff")))

;; Executer le script ruby courant
(defun run-current-script ()
  (interactive)
  (progn
    (if (get-buffer "*ruby script*")
        (kill-buffer "*ruby script*"))
    (start-process "current script" "*ruby script*" "ruby" (buffer-file-name))
    (display-buffer "*ruby script*")))

;; Add a key binding
(add-hook 'ruby-mode-hook
          (lambda () (define-key ruby-mode-map (kbd "C-c C-c .") 'run-current-script)))

(add-hook 'ruby-mode
          (lambda () (require 'ruby-test)))

(require 'ruby-test)
(put 'upcase-region 'disabled nil)

;; Use inf-ruby in ruby mode
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")

(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")

(add-hook 'ruby-mode-hook
          '(lambda ()
             (inf-ruby-keys)
             ))

(provide 'ruby-stuff)