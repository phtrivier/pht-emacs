;; This assumes that constant 'pht-lisp-dir has been set

;; Stuff packages can use this to simply add required folders
(defun add-load-path-dir (dir-to-add)
  (add-to-list 'load-path (expand-file-name (concat pht-lisp-dir "/" dir-to-add))))

;; Here comes all my actual packages

(require 'ruby-stuff)
(require 'scons-stuff)
;;(require 'clojure-stuff)
(require 'org-stuff)
;; (require 'boots-puzzle-stuff)
(require 'scala-stuff)
(require 'stevey-stuff)
(require 'misc-stuff)

(provide 'pht-stuff)