#!/bin/bash
for DOCKERFILE in ./admin/*; do
    VARIANT=$(cut -d "." -f3- <<<"$DOCKERFILE")
    #echo $VARIANT
    if [[ -z $VARIANT ]]; then
        docker build --tag lqss/jenkins:admin --file $DOCKERFILE .
    else
        docker build --tag lqss/jenkins:admin-$VARIANT --file $DOCKERFILE .
    fi
done