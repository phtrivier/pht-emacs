(add-to-list 'load-path "~/sandbox/src/cedet-1.0pre6/common")
(require 'cedet)

;; Cedet configuration
(global-ede-mode t)

(semantic-load-enable-excessive-code-helpers)

(require 'semantic-ia)
(require 'semantic-gcc)

(defun pht-cedet-hook-1 ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))

(add-hook 'c-mode-common-hook 'pht-cedet-hook-1)
(add-hook 'c++-mode-common-hook 'pht-cedet-hook-1)

(defun pht-cedet-hook-2 ()
 (local-set-key "." 'semantic-complete-self-insert)
 (local-set-key ">" 'semantic-complete-self-insert))

(add-hook 'c-mode-common-hook 'pht-cedet-hook-2)
(add-hook 'c++-mode-common-hook 'pht-cedet-hook-2)

(defun pht-cedet-hook-3 ()
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref))

(add-hook 'c-mode-common-hook 'pht-cedet-hook-3)
(add-hook 'c++-mode-common-hook 'pht-cedet-hook-3)

(provide 'cedet-stuff)