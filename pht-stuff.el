;; This assumes that constant 'pht-lisp-dir has been set

;; Stuff packages can use this to simply add required folders
(defun add-load-path-dir (dir-to-add)
  (add-to-list 'load-path (expand-file-name (concat pht-lisp-dir "/" dir-to-add))))

;; This tells emacs to use custom.el to
;; store customizations made through 'customize' interface
(setq custom-file (expand-file-name (concat pht-lisp-dir "/custom.el")))
(load custom-file 'noerror)

;; ---------------------------------
;; Here comes all my actual packages
;; Select as appropriate .. 

(require 'ruby-stuff)
;;(require 'scons-stuff)
;;(require 'clojure-stuff)
(require 'org-stuff)
;;(require 'boots-puzzle-stuff)
;;(require 'scala-stuff)
(require 'stevey-stuff)
(require 'misc-stuff)
(require 'lua-stuff)
(require 'color-stuff)
(require 'magit-stuff)
(require 'muse-stuff)
;; Next package comes here ... 

(provide 'pht-stuff)