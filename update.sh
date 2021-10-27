#!/usr/bin/env bash

echo '=============================='
echo 'Updating container images'
echo '=============================='
docker-compose pull

echo '=============================='
echo 'Restarting the containers'
echo '=============================='
docker-compose up -d

str1="$1"
str2="--prune"

if [ "$str1" == "$str2" ]; then
    echo '=============================='
    echo 'Removing unused images'
    echo '=============================='
    docker image prune --all
fi