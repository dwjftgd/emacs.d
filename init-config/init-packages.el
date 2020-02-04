;;
;; init packages
;;

(require 'package)

(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))) ;; set package-archives
(setq package-archive-priorities
      '(("gnu" . 10))) ;; set priorities

(add-to-list 'package-archives
	     '("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")) ;; add melpa stable
(add-to-list 'package-archive-priorities
	     '("melpa-stable" . 0))

(package-initialize) ;; activate packages

(setq pkg-list '(smex))
(add-to-list 'pkg-list 'undo-tree)
(add-to-list 'pkg-list 'ace-jump-mode)
(add-to-list 'pkg-list 'evil)
(add-to-list 'pkg-list 'yasnippet)
(add-to-list 'pkg-list 'use-package)

(unless package-archive-contents
  (package-refresh-contents)) ;; update package contents

(dolist (pkg pkg-list)
  (unless (package-installed-p pkg)
    (package-install pkg))) ;; install packages in pkg-list

(dolist (pkg pkg-list)
  (let* ((init-conf-dir (file-name-directory (or load-file-name buffer-file-name)))
	 (pkg-conf-dir (concat init-conf-dir "packages-conf"))
	 (init-prefix "init-")
	 (init-suffix ".el")
	 (init-pkg (symbol-name (symbol-value 'pkg)))
	 (init-sym (concat init-prefix init-pkg))
	 (init-filename (concat init-sym init-suffix))
	 (init-filepath (concat pkg-conf-dir init-filename)))
    (unless (file-directory-p pkg-conf-dir)
      (make-directory pkg-conf-dir))
    (add-to-list 'load-path pkg-conf-dir)
    (if (file-exists-p init-filename)
	(require (intern init-sym))
      (message "file: %s not found" init-filename)))) ;; init packages in pkg-list

;; (dolist (pkg pkg-list)
;;   (message (symbol-name (intern (concat init-prefix (symbol-name (symbol-value 'pkg)))))))

(provide 'init-packages)
