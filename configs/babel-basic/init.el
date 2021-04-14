(setq org-confirm-babel-evaluate nil)

(org-babel-do-load-languages 'org-babel-load-languages
			     '((shell . t)
			       (python . t)))

(setq org-export-use-babel nil)

;; Use python3 as the interpreter for python source blocks
(custom-set-variables '(org-babel-python-command "python3"))

(setq initial-major-mode 'org-mode)

(setq initial-scratch-message "\
#+TITLE: Scratch Buffer
This buffer is for notes you don't want to save, in orgmode
If you want to create a file, visit that file with C-x C-f,
then enter the text in that file's own buffer.

#+begin_src emacs-lisp

,#+end_src
")

