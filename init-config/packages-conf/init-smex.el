;;
;; smex config
;;

(use-package smex
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'smex))
;;  (global-set-key (kbd "C-c C-c M-x" 'execute-extended-command)))

(provide 'init-smex)
