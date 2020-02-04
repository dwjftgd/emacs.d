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

;; back-up dir
(setq backup-dname (locate-user-emacs-file "backup"))
(unless (file-directory-p backup-dname)
  (make-directory backup-dname)) ;; create back-up dir

(setq backup-by-copying t
      backup-directory-alist `(("." . ,backup-dname))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t) ;; config back-up

;; auto-save dir
(setq autosave-dname (locate-user-emacs-file "auto-save/"))
(unless (file-directory-p autosave-dname)
  (make-directory autosave-dname)) ;; create auto-save dir
(setq auto-save-list-file-prefix (concat autosave-dname "save-")) ;; auto-save-list prefix
(setq tramp-auto-save-directory autosave-dname) ;; transparent remote access, save file to local dir
(setq auto-save-file-name-transforms
      `((".*" ,autosave-dname t)))

(setq auto-save-default t
      auto-save-timeout 20
      auto-save-interval 100)

(provide 'init-config)
