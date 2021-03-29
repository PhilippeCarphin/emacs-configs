
;; Use agenda files as refile targets
(setq org-refile-targets '((nil :maxlevel . 3) (org-agenda-files :maxlevel . 3)))
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-use-outline-path 'file)

;; Define new TODO keywords
(setq org-todo-keywords 
      '((sequence "TODO" "WAITING" "VERIFY" "|" "DONE")
        (sequence "GTD-IN(i)" "GTD-CLARIFY(c)" "GTD-PROJECT(p)"
                  "GTD-SOMEDAY-MAYBE(s)" "GTD-ACTION(a)" "GTD-NEXT-ACTION(n)"
                  "GTD-WAITING(w)" "|" "GTD-REFERENCE(r)"
                  "GTD-DELEGATED(g)" "GTD-DONE(d)")))

;; Set their face properties
(setq org-todo-keyword-faces
      '(("GTD-IN" :foreground "#ff8800" :weight normal :underline t :size small)
        ("GTD-PROJECT" :foreground "#0088ff" :weight bold :underline t)
        ("GTD-ACTION" :foreground "#0088ff" :weight normal :underline nil)
        ("GTD-NEXT-ACTION" :foreground "#0088ff" :weight bold :underline nil)
        ("GTD-WAITING" :foreground "#aaaa00" :weight normal :underline nil)
        ("GTD-REFERENCE" :foreground "#00ff00" :weight normal :underline nil)
        ("GTD-SOMEDAY-MAYBE" :foreground "#7c7c74" :weight normal :underline nil)
        ("GTD-DONE" :foreground "#00ff00" :weight normal :underline nil)))
