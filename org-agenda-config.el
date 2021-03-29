;; Set cross-platform directory : ~/Documents/gtd
(cond ((string-equal system-type "windows-nt")
       (progn (setq org-agenda-dir "c:\\Users\\phil1\\Documents\\gtd")))
      ((string-equal system-type "darwin")
       (progn (setq org-agenda-dir "~/Documents/gtd/")))
      ((string-equal system-type "gnu/linux")
       (progn (setq org-agenda-dir "~/Documents/gtd/"))))
(setq org-agenda-files (list org-agenda-dir))

;; Nicer vertical alignment in the agenda
(setq org-agenda-prefix-format  '((agenda . "%-12t%-12s")))
