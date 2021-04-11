#!/bin/bash

py_follow_links()
{
    python -c "import os,sys; print(os.path.realpath(sys.argv[1]))" $1
}

this_file=$(py_follow_links $0)
bin_dir=$(dirname $this_file)
base_dir=$(cd $bin_dir/.. && pwd)

emacs_user_directory=$(pwd)

echo $this_file
echo $base_dir
echo "USER_EMACS_DIRECTORY = $user_emacs_directory"
if ! [ -e $emacs_user_directory/init.el ] ; then
    echo "ERROR: No init.el in emacs_user_directory ($1 must be the path of an emacs config dir)"
    exit 1
fi

socket=$(basename $emacs_user_directory)
# Intercept for certain first arguments
case $1 in
    -s)
        emacs --daemon=$socket -q --eval "
          (setq user-emacs-directory
             \"$emacs_user_directory/\")
          " -l $emacs_user_directory/init.el -l $base_dir/configs/evil-config.el
        exit 0
        ;;
esac

emacsclient -s $socket $@
