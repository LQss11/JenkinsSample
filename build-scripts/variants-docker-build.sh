#!/bin/bash
# This command will allow pipeline from running this script to prevent permission denied output
# git update-index --chmod=+x .\build-scripts\anonymous-docker-build.sh
for VARIANT in ./variants/*; do
    VARIANTS+=($(echo $VARIANT | cut -d "/" -f3))
done

#echo  ${VARIANTS[1]}
for VARIANT in ${VARIANTS[@]}; do
    echo "BUILDING lqss/jenkins:admin-$VARIANT"
    docker build --tag lqss/jenkins:admin-$VARIANT --file ./variants/$VARIANT/Dockerfile ./variants/$VARIANT

    echo "BUILDING lqss/jenkins:anonymous-$VARIANT"
    sed -i "s/admin/anonymous/g" ./variants/$VARIANT/Dockerfile
    sleep 2
    docker build --tag lqss/jenkins:anonymous --file ./variants/$VARIANT/Dockerfile ./variants/$VARIANT
    sed -i "s/anonymous/admin/g" ./variants/$VARIANT/Dockerfile
done
