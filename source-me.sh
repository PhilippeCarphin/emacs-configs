#!/bin/bash

true
if ! (return 2>/dev/null) ; then
    echo "ERROR : This file must be sourced"
    exit 1
fi

py_follow_links()
{
    python -c "import os,sys; print(os.path.realpath(sys.argv[1]))" $1
}

this_file=$(py_follow_links ${BASH_SOURCE[0]})
this_dir=$(dirname $this_file)
            
export PATH=$this_dir/bin:$PATH

