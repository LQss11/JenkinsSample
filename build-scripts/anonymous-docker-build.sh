#!/bin/bash
for DOCKERFILE in ./anonymous/*; do
    VARIANT=$(cut -d "." -f3- <<<"$DOCKERFILE")
    #echo $VARIANT
    if [[ -z $VARIANT ]]; then
        docker build --tag lqss/jenkins:anonymous --file $DOCKERFILE .
        docker push lqss/jenkins:anonymous
    else
        docker build --tag lqss/jenkins:anonymous-$VARIANT --file $DOCKERFILE .
        docker push lqss/jenkins:anonymous-$VARIANT
    fi
done