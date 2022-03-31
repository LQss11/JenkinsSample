#!/bin/bash
for DOCKERFILE in ./anonymous/*; do
    VARIANT=$(cut -d "." -f3- <<<"$DOCKERFILE")
    #echo $VARIANT
    if [[ -z $VARIANT ]]; then
        docker build --tag lqss/jenkins:anonymous --file $DOCKERFILE .
    else
        docker build --tag lqss/jenkins:anonymous-$VARIANT --file $DOCKERFILE .
    fi
done