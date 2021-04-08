;; Activate languages for executing source blocks
(org-babel-do-load-languages 'org-babel-load-languages
			     '((shell . t)
			       (python . t)))

;; Get rid of the prompt that asks us if we want to evaluate code blocks
(setq org-confirm-babel-evaluate nil)

;; Disable automatic execution when exporting
;; (setq org-export-use-babel nil)

;; Use python3 as the interpreter for python source blocks
(custom-set-variables '(org-babel-python-command "python3"))
