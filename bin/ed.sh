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
    echo "ERROR: No init.el in user_emacs_directory ($1 must be the path of an emacs config dir)"
    exit 1
fi

$base_dir/bin/check-version.sh

socket=$(basename $user_emacs_directory)
# Intercept for certain first arguments

code="(progn (setq user-emacs-directory \"$user_emacs_directory\") "
code+=$'\n  (load-file (concat user-emacs-directory "init.el"))'
code+=$'\n  (tool-bar-mode -1)'
prog=$(basename $0)
if [[ "$prog" == *b* ]] ; then
    code+=$'\n  '"(load-file \"$base_dir/configs/basic-configs.el\")"
fi
if [[ "$prog" == *v* ]] || [[ "$prog" == *h* ]] ; then
    code+=$'\n  '"(load-file \"$base_dir/configs/bootstrap.el\") "
fi
if [[ "$prog" == *v* ]] ; then
    code+=$'\n  '"(load-file \"$base_dir/configs/evil-config.el\") "
fi
if [[ "$prog" == *h* ]] ; then
    code+=$'\n  '"(load-file \"$base_dir/configs/helpers.el\") "
fi
code+=$'\n)'

echo "$code"
emacs -q --eval "$code" $@