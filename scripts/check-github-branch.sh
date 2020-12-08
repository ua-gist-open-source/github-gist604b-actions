#!/bin/sh -l

set -x

THIS_BRANCH=$1

EXTRACTED_BRANCH=$(grep 'The name of my branch is: ' README.md | sed 's/The name of my branch is://' | sed 's/^ *//g')
if [ -z "$EXTRACTED_BRANCH" ]; then
    echo You should enter the branch name on the line starting with: \"The name of my branch is: \"
    echo The name of _this_ branch is $THIS_BRANCH
    exit 1
fi
if [  "$THIS_BRANCH" != "$EXTRACTED_BRANCH" ]; then
    echo "The branch names should match: \'$THIS_BRANCH\' != \'$EXTRACTED_BRANCH\'"
    exit 1
fi
if [  "$THIS_BRANCH" != "my_branch" ]; then
    echo "The branch name should be: \'my_branch\'"
    exit 1
fi

