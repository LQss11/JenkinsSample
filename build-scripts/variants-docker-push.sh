#!/bin/bash
# This command will allow pipeline from running this script to prevent permission denied output
# git update-index --chmod=+x .\build-scripts\anonymous-docker-build.sh
for VARIANT in ./variants/*; do
    VARIANTS+=($(echo $VARIANT | cut -d "/" -f3))
done

#echo  ${VARIANTS[1]}
for VARIANT in ${VARIANTS[@]}; do
    echo "PUSHING lqss/jenkins:admin-$VARIANT"
    docker push lqss/jenkins:admin-$VARIANT
    echo "PUSHING lqss/jenkins:anonymous-$VARIANT"
    docker push lqss/jenkins:anonymous-$VARIANT
done

echo "Pushing base images..."
echo "PUSHING lqss/jenkins:admin"
docker push lqss/jenkins:admin
echo "PUSHING lqss/jenkins:anonymous"
docker push lqss/jenkins:anonymous
echo "PUSHING lqss/jenkins:latest"
docker image tag lqss/jenkins:admin lqss/jenkins:latest
docker push lqss/jenkins:latest