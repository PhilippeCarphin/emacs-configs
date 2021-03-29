(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages 'org-babel-load-languages
			     '((shell . t)
			       (python . t)))
(setq org-export-use-babel nil)
