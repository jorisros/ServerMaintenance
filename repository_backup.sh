#!/bin/sh

source .env

ORGANISATION=${1:-$GITHUB_ORGANISATION}
REPO_NAME=${2:-$GITHUB_REPO_NAME}
BRANCH=${3:-$GITHUB_BRANCH}
DESTINATION=${4:-$GITHUB_DESTINATION}

if [ -n "$GITHUB_TOKEN" ]
then
    wget --header="Authorization: token $TOKEN" --header="Accept:application/vnd.github.v3.raw" -O - https://api.github.com/repos/$ORGANISATION/$REPO_NAME/tarball/$BRANCH | tar xz -C $DESTINATION
else
    wget --header="Accept:application/vnd.github.v3.raw" -O - https://api.github.com/repos/$ORGANISATION/$REPO_NAME/tarball/$BRANCH | tar xz -C $DESTINATION
fi
