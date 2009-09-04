;; CLOJURE
(add-to-list 'load-path "~/opt/clojure-mode")
(require 'clojure-auto)

;; SLIME
;; (setq inferior-lisp-program "clisp")
(add-to-list 'load-path "~/opt/slime")
(require 'slime)
(slime-setup)

;;(setq swank-clojure-jar-path "~/opt/clojure/clojure.jar")

;; (add-to-list 'load-path "~/opt/swank-clojure")
;; (swank-clojure-config
;;   (setq swank-clojure-jar-path "~/opt/clojure/clojure.jar")
;;   (setq swank-clojure-binary "~/opt/programming-clojure/bin/repl.sh"))

(add-to-list 'load-path "~/opt/swank-clojure")
(setq swank-clojure-jar-path "~/opt/clojure/clojure.jar")
(setq swank-clojure-extra-classpaths
      (list "~/opt/clojure-contrib/clojure-contrib.jar"
            "~/.clojure/jline-0.9.94.jar"
            "~/opt/programming-clojure/*"))
(require 'swank-clojure-autoload)

(provide 'clojure-stuff)