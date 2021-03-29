;;; Load the config
(setq emacs-configs-repo "~/Documents/GitHub/emacs-configs")

(load-file (concat emacs-configs-repo "/babel-config.el"))
(load-file (concat emacs-configs-repo "/org-export-config.el"))
(load-file (concat emacs-configs-repo "/basic-configs.el"))
(load-file (concat emacs-configs-repo "/helpers.el"))
(load-file (concat emacs-configs-repo "/evil-config.el"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor-type '(bar . 4))
 '(custom-enabled-themes '(misterioso))
 '(indent-tabs-mode nil)
 '(org-image-actual-width 100)
 '(org-startup-with-inline-images t)
 '(package-selected-packages
   '(magit company which-key helm htmlize ox-reveal ox-twbs ox-rst ox-gfm use-package evil))
 '(vc-follow-symlinks t)
 '(visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 200))))
 '(cursor ((t (:background "SlateGray3")))))
