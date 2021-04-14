#!/bin/bash

emacs_version=$(emacs --version | head -n 1 | cut -d ' ' -f 3)
emacs_major_version=${emacs_version%%.*}
if (($emacs_major_version < 27)) ; then
    echo "ERROR : Emacs 27 is required"
    exit 1
fi

py_follow_links()
{
    python -c "import os,sys; print(os.path.realpath(sys.argv[1]))" $1
}

this_file=$(py_follow_links $0)
bin_dir=$(dirname $this_file)
base_dir=$(cd $bin_dir/.. && pwd)

temp_user_emacs_directory=$(pwd)/

echo "USER_EMACS_DIRECTORY = $temp_user_emacs_directory"
if ! [ -e $temp_user_emacs_directory/init.el ] ; then
    echo "$0 : No init.el in temp_user_emacs_directory ($1 must be the path of an emacs config dir)"
    echo "Select from 1:babel-basic 2:fast-notes 3:org-export-config 4:org-agenda-basic 5:org-agenda-intermediate 6:good-to-go 7:helpers"
    read answer
    case $answer in
        1)
            temp_user_emacs_directory=$base_dir/configs/babel-basic/
            ;;
        2)
            temp_user_emacs_directory=$base_dir/configs/fast-notes/
            ;;
        3)
            temp_user_emacs_directory=$base_dir/configs/org-export-config/
            ;;
        4)
            temp_user_emacs_directory=$base_dir/configs/org-agenda-basic/
            ;;
        5)
            temp_user_emacs_directory=$base_dir/configs/org-agenda-intermediate/
            ;;
        6)
            temp_user_emacs_directory=$base_dir/configs/gtg/
            ;;
        7)
            temp_user_emacs_directory=$base_dir/configs/helpers/
            ;;
        *)
            echo "unknown choice '$answer"
            exit 1
            ;;
    esac

fi

$base_dir/bin/check-version.sh

socket=$(basename $temp_user_emacs_directory)

code="(progn"

# User emacs directory
if ! touch $temp_user_emacs_directory ; then
    tmp_package_dir=~/emacs.tmp.d/elpa
    echo "user_emacs_directory '$user_emacs_directory' is not writable, using '$tmp_package_dir' as package-user-dir"
    mkdir -p $tmp_package_dir
    code+=$'\n  '"(setq package-user-dir \"$tmp_package_dir\")"
fi
user_emacs_directory=$temp_user_emacs_directory
code+=$'\n  '"(setq user-emacs-directory \"$user_emacs_directory\")"

code+=$'\n  '"(load-file \"$base_dir/configs/bootstrap.el\") "
code+=$'\n  '"(load-file \"$temp_user_emacs_directory/init.el\")"
code+=$'\n  '"(global-set-key (kbd \"C-x C-c\") 'save-buffers-kill-emacs)"
code+=$'\n  '"(tool-bar-mode -1)"
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
