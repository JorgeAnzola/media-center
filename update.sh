#!/usr/bin/env bash

echo '=============================='
echo 'Updating Plex image'
echo '=============================='
docker pull ghcr.io/linuxserver/plex

echo '=============================='
echo 'Updating Jackett image'
echo '=============================='
docker pull ghcr.io/linuxserver/jackett

echo '=============================='
echo 'Updating Radarr image'
echo '=============================='
docker pull ghcr.io/linuxserver/radarr

echo '=============================='
echo 'Updating Sonarr image'
echo '=============================='
docker pull ghcr.io/linuxserver/sonarr

echo '=============================='
echo 'Updating Transmission image'
echo '=============================='
docker pull ghcr.io/linuxserver/transmission

echo '=============================='
echo 'Updating Tautulli image'
echo '=============================='
docker pull ghcr.io/linuxserver/tautulli

echo '=============================='
echo 'Stopping the containers'
echo '=============================='
docker-compose down

echo '=============================='
echo 'Starting the containers'
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

