;; aryyya's emacs configuration
;;
;; to install packages, use:
;;   (package-refresh-contents)
;;   (package-install-selected-packages)
;;

(defun init-emacs ()

  ;; initialize the user interface
  (init-ui)

  ;; initialize stuff that doesn't fit anywhere else
  (init-misc)

  ;; initialize package repositories
  (init-package-repos)

  ;; initialize packages
  (init-packages)

  )

(defun init-ui ()
  
  ;; configure settings for gui mode
  (if (display-graphic-p)
      (progn
	
	;; disable gui features
	(toggle-scroll-bar -1)
	(tool-bar-mode -1)

	;; fix window gaps
	(setq frame-resize-pixelwise t)

	;; set font face
	(set-default-font "Menlo 14")

	;; show end of files in fringe
	(toggle-indicate-empty-lines)

	;; disable bell
	(setq ring-bell-function 'ignore)
	
	)
    )
  )

(defun init-misc ()

  (setq init-file "~/.emacs.d/init.el")

  ;; reload init file
  (defun reload-init ()
    (interactive)
    (load-file init-file))

  ;; edit init file
  (defun edit-init ()
    (interactive)
    (find-file init-file))
  
  ;; add system paths
  (add-to-list 'exec-path "/usr/local/bin")

  ;; don't word wrap
  (setq-default truncate-lines 0)

  ;; use dired find alternate file key
  (put 'dired-find-alternate-file 'disabled nil)

  )

(defun init-package-repos ()

  ;; package initialize before configurations of installed packages
  (package-initialize)

  ;; add melpa repo
  (require 'package)
  (add-to-list 'package-archives
	       '("melpa" . "https://melpa.org/packages/"))

  )

(defun init-packages ()

  ;; rainbow-delimiters
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)

  ;; paredit
  (add-hook 'clojure-mode-hook #'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
  (add-hook 'cider-repl-mode-hook #'paredit-mode)

  ;; show-paren
  (add-hook 'prog-mode-hook #'show-paren-mode)

  ;; treemacs
  (setq treemacs-no-png-images t)
  (setq treemacs-show-cursor t)
  (setq treemacs-width 25)
  (global-set-key (kbd "s-b") 'treemacs)

  ;; diff-hl
  (global-diff-hl-mode)
  
  )

;; execute configuration
(init-emacs)

;; emacs bookkeeping (do not hand modify the file past here)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (diff-hl haskell-mode rainbow-delimiters treemacs paredit cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

