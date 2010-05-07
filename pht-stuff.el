;; This assumes that constant 'pht-lisp-dir has been set

;; Stuff packages can use this to simply add required folders
(defun add-load-path-dir (dir-to-add)
  (add-to-list 'load-path (expand-file-name (concat pht-lisp-dir "/" dir-to-add))))

(defun open-pht-emacs ()
  (interactive)
  (find-file (concat pht-lisp-dir "/pht-stuff.el")))

;; This tells emacs to use custom.el to
;; store customizations made through 'customize' interface
(setq custom-file (expand-file-name (concat pht-lisp-dir "/custom.el")))
(load custom-file)

;; I want an emacs-server started if possible
(server-start)

;; ---------------------------------
;; Here comes all my actual packages
;; Select as appropriate .. 
(require 'color-stuff)
(require 'cedet-stuff)
(require 'ruby-stuff)
;; ;;(require 'scons-stuff)
;; ;;(require 'clojure-stuff)
(require 'org-stuff)
;; ;;(require 'boots-puzzle-stuff)
;; ;;(require 'scala-stuff)
(require 'stevey-stuff)
(require 'misc-stuff)
(require 'lua-stuff)
(require 'magit-stuff)
(require 'muse-stuff)
(require 'cpp-stuff)
(require 'nsi-stuff)
(require 'actionscript-mode)
;; Next package comes here ... 

(provide 'pht-stuff)