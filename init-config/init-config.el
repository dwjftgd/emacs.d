;;
;; emacs basic config
;;

;; (tool-bar-mode 0) ;; disable tool-bar

(menu-bar-mode 0) ;; disable menu-bar

(setq inhibit-startup-message t) ;; inhibit startup message

(setq-default case-fold-search nil) ;; case-sensitive for searches and matches

(when (version<="26.0.50" emacs-version)
  (global-display-line-numbers-mode))

(setq-default tab-always-indent 'complete) ;; set <tab> key do indent first then completion

;;;; back-up dir
;;(setq backup-by-copying t
;;      backup-directory-alist '(("." . (locate-user-emacs-file "backup")))
;;      delete-old-versions t
;;      kept-new-versions 6
;;      kept-old-versions 2
;;      version-control t)

(provide 'init-config)
