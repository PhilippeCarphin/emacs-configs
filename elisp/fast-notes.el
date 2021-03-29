;; A platform independant directory for orgmode files
(cond ((string-equal system-type "windows-nt")
       (progn (setq org-agenda-dir "c:\\Users\\phil1\\Documents\\gtd")))
      ((string-equal system-type "darwin")
       (progn (setq org-agenda-dir "~/Documents/gtd/")))
      ((string-equal system-type "gnu/linux")
       (progn (setq org-agenda-dir "~/Documents/gtd/"))))
(setq org-agenda-files (list org-agenda-dir))

;; Defining symbols for important files
(setq gtd-in-tray-file (concat org-agenda-dir "GTD_InTray.org")
      gtd-project-list-file (concat org-agenda-dir "GTD_ProjectList.org")
      gtd-reference-file (concat org-agenda-dir "GTD_Reference.org"))

;; Individual functions for those files
;; These names are displayed in the which-key popup
(defun gtd-open-in-tray      () (interactive) (find-file gtd-in-tray-file))
(defun gtd-open-project-list () (interactive) (find-file gtd-project-list-file))
(defun gtd-open-reference   () (interactive) (find-file gtd-reference-file))

(define-prefix-command 'leader-key)
(global-set-key (kbd "M-m") 'leader-key)

(define-prefix-command 'gtd)
(define-key leader-key (kbd "g") 'gtd)

(define-key gtd (kbd "c") 'org-capture)
(define-key gtd (kbd "i") 'gtd-open-in-tray)
(define-key gtd (kbd "p") 'gtd-open-project-list)
(define-key gtd (kbd "r") 'gtd-open-reference)

(setq org-capture-templates
      '(("i" "GTD Input" entry (file gtd-in-tray-file)
	 "* GTD-IN %?\n %i\n %a" :kill-buffer t)
	("c" "Emacs config" entry (file emacs-config-file)
	 "* GTD-IN %?\n %i\n %a" :kill-buffer t)))
