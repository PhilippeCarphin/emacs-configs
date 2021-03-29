;;; Load the config
(setq emacs-configs-repo "~/Documents/GitHub/emacs-configs")

(load-file (concat emacs-configs-repo "/babel-config.el"))
(load-file (concat emacs-configs-repo "/org-export-config.el"))
(load-file (concat emacs-configs-repo "/basic-configs.el"))
(load-file (concat emacs-configs-repo "/helpers.el"))
(load-file (concat emacs-configs-repo "/evil-config.el"))

