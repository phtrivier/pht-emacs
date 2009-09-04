This is part of my emacs personnal emacs conf. 

Add this to .emacs, and forget about the rest : 


;; Adapt this constant accordingly
(defconst pht-lisp-dir "~/site-lisp/pht-emacs")

(add-to-list 'load-path (expand-file-name pht-lisp-dir))
(require 'pht-stuff)
;; That's all.

