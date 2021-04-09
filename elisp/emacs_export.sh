#!/bin/bash

#!/bin/bash

py_follow_links()
{
    python -c "import os,sys; print(os.path.realpath(sys.argv[1]))" $1
}

this_file=$(py_follow_links $0)
this_dir=$(dirname $this_file)

emacs -q --eval "(progn
                    (load-theme 'misterioso)
                    (setq package-user-dir \"${this_dir}/elpa\")
                    (load-file \"$this_dir/org-export-config.el\"))"
