#!/bin/bash

version=$(emacs --batch -q --eval '(message emacs-version)' 2>&1)
major_version=${version%.*}

if (( major_version < 27 )) ; then
    echo "WARNING: You are using emacs $version < 27 which might not work with
    helm and some of the extra export formats"
fi
