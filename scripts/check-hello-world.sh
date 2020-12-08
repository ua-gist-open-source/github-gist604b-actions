#!/bin/bash

set -x

USER=$1

echo 1
url=$(grep 'URL of my repository' README.md | sed 's/URL of my repository://' | sed 's/^ *//g')
if [ -z "$url" ]; then
    echo URL should be on same line with \"URL of my repository:\"
    exit 1
fi
echo 1
is_this_repo=$(echo $url | grep github.com/ua-gist-open-source)
if [ -n $is_this_repo ]; then
    echo URL should be for your newly created github repo 
    exit 1
fi
echo 1
is_user_repo=$(echo $url | grep github.com/$USER)
if [ -z $is_user_repo ]; then
    echo URL should probably have your USERNAME it: $url does not have \'$USER\' in it
    exit 1
fi
echo 1
status=$(curl -s -I -L -o /dev/null -w "%{http_code}" $url)
echo 1
ok=$(echo $status | grep ^2)
echo 1
if [ -z $ok ]; then
    echo URL $url not found or is not public: status: $status
    exit 1
fi
echo 1
