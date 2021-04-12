#!/bin/bash

py_follow_links()
{
    python -c "import os,sys; print(os.path.realpath(sys.argv[1]))" $1
}

this_file=$(py_follow_links $0)
bin_dir=$(dirname $this_file)
base_dir=$(cd $bin_dir/.. && pwd)

user_emacs_directory=$(pwd)/

echo "USER_EMACS_DIRECTORY = $user_emacs_directory"
if ! [ -e $user_emacs_directory/init.el ] ; then
    echo "$0 : No init.el in user_emacs_directory ($1 must be the path of an emacs config dir)"
    echo "Select from 1:babel-basic 2:fast-notes 3:org-export-config 4:org-agenda-basic 5:org-agenda-intermediate 6:good-to-go 7:helpers"
    read answer
    case $answer in
        1)
            user_emacs_directory=$base_dir/configs/babel-basic/
            ;;
        2)
            user_emacs_directory=$base_dir/configs/fast-notes/
            ;;
        3)
            user_emacs_directory=$base_dir/configs/org-export-config/
            ;;
        4)
            user_emacs_directory=$base_dir/configs/org-agenda-basic/
            ;;
        5)
            user_emacs_directory=$base_dir/configs/org-agenda-intermediate/
            ;;
        6)
            user_emacs_directory=$base_dir/configs/gtg/
            ;;
        7)
            user_emacs_directory=$base_dir/configs/helpers/
            ;;
        *)
            echo "unknown choice '$answer"
            exit 1
            ;;
    esac

fi

$base_dir/bin/check-version.sh

socket=$(basename $user_emacs_directory)

code="(progn"
if ! touch $user_emacs_directory ; then
    echo "user_emacs_directory '$user_emacs_directory' is not writable, using ~/.emacs.d/elpa as package-user-dir"
    mkdir -p ~/.emacs.d/elpa
fi
code+=$'\n  '"(load-file \"$base_dir/configs/bootstrap.el\") "
code+=$'\n '" (load-file \"$user_emacs_directory/init.el\")"
code+=$'\n '"(global-set-key (kbd \"C-x C-c\") 'save-buffers-kill-emacs)"
code+=$'\n  (tool-bar-mode -1)'
prog=$(basename $0)
if [[ "$prog" == *b* ]] ; then
    code+=$'\n  '"(load-file \"$base_dir/configs/basic-configs.el\")"
fi
if [[ "$prog" == *v* ]] ; then
    code+=$'\n  '"(load-file \"$base_dir/configs/evil-config.el\") "
fi
if [[ "$prog" == *h* ]] ; then
    code+=$'\n  '"(load-file \"$base_dir/configs/helpers.el\") "
fi
code+=$'\n)'

# echo "$code"
if [[ "$prog" == *d* ]] ; then
    emacs -q --daemon=$socket --eval "$code" $@
else
    emacs -q --eval "$code" $@
fi
