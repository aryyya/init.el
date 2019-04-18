;; aryyya's emacs configuration
;;
;; to install packages, use:
;;   (package-refresh-contents)
;;   (package-install-selected-packages)
;;

(defun init-emacs ()
  (init-ui)
  (init-misc)
  (init-package-repos)
  (init-packages)
  )

(defun init-ui ()
  (if (display-graphic-p)
      (progn
	(toggle-scroll-bar -1)
	(tool-bar-mode -1)
	(setq frame-resize-pixelwise t)
	(set-default-font "Menlo 14")
	(setq ring-bell-function 'ignore)
	)
    )
  )

(defun init-misc ()
  (setq init-file "~/.emacs.d/init.el")

  (defun load-init ()
    (interactive)
    (load-file init-file))

  (defun edit-init ()
    (interactive)
    (find-file init-file))
  
  ;; add system paths
  (add-to-list 'exec-path "/usr/local/bin")

  ;; don't word wrap
  (setq-default truncate-lines 0)
  )

(defun init-package-repos ()
  (package-initialize)

  ;; add melpa repo
  (require 'package)
  (add-to-list 'package-archives
	       '("melpa" . "https://melpa.org/packages/"))
  )

(defun init-packages ()
  (require 'use-package)

  (use-package dired
    :config
    (put 'dired-find-alternate-file 'disabled nil)    
    )

  (use-package rainbow-delimiters-mode
    :hook
    (prog-mode cider-repl-mode)
    )

  (use-package paredit-mode
    :hook
    (clojure-mode emacs-lisp-mode cider-repl-mode)
    )

  (use-package show-paren-mode
    :hook
    (prog-mode)
    )

  (use-package treemacs
    :config
    (setq treemacs-no-png-images t)
    (setq treemacs-show-cursor t)
    (setq treemacs-width 25)
    (global-set-key (kbd "s-b") 'treemacs)
    )

  (use-package diff-hl-mode
    :hook
    (prog-mode))

  (use-package diff-hl-flydiff-mode
    :hook
    (prog-mode)
    )
  )

(init-emacs)

;; emacs bookkeeping (do not hand modify the file past here)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (use-package diff-hl haskell-mode rainbow-delimiters treemacs paredit cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

