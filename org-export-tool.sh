

#+begin_src shell :exports code :tangle yes
#!/bin/bash

if [[ "$1" != *.org ]] ; then
    echo "ERROR : Input must be an orgmode (*.org) file."
    exit 1
fi

base_file=${1%.org}
input_file=$1
output_file=${base_file}.org

read -r -d '' INIT <<-END
	(progn
	  (setq package-user-dir "~/.emacs.d/o")
	  ;; Package bootstrap
	  (require 'package)
	  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
	  (add-to-list 'package-archives '("org"   . "http://orgmode.org/elpa/") t)
	  (add-to-list 'package-archives '("gnu"   . "http://elpa.gnu.org/packages/") t)
	  (package-initialize)
	  (unless (package-installed-p 'use-package)
	    (package-refresh-contents)
	    (package-install 'use-package))
	  (eval-when-compile (require 'use-package))

	  ;; Actual org export config (Adds four formats and htmlize for code coloring in
	  ;; all export formats.
	  (use-package ox-twbs :ensure t)
	  (use-package htmlize :ensure t))
END

echo "$INIT"
if emacs --batch --eval "$INIT" $input_file -f org-twbs-export-to-html ;
then
    echo "Successfully exported $input_file to $output_file"
fi
#+end_src
