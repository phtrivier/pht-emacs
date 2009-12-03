;; Steve Yegge's effective emacs

;; M- is a bad idea, apparently
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; C-l remove the last word (so that when I make a mistake, it is
;; better to just kill last word and retype it
(global-set-key "\C-l" 'backward-kill-word)
;; This kills a whole region
(global-set-key "\C-x\C-k" 'kill-region)
;; This is the same thing, but with C-c instead of C-x, so that it is
;; okay to mess up a bit
(global-set-key "\C-c\C-k" 'kill-region)

(provide 'stevey-stuff)