#!/bin/sh

source .env

if [ -n "$GITHUB_TOKEN" ]
then
    wget --header="Authorization: token $GITHUB_TOKEN" --header="Accept:application/vnd.github.v3.raw" -O - https://api.github.com/repos/$GITHUB_ORGANISATION/$GITHUB_REPO_NAME/tarball/$GITHUB_BRANCH | tar xz -C $GITHUB_DESTINATION
else
    wget --header="Accept:application/vnd.github.v3.raw" -O - https://api.github.com/repos/$GITHUB_ORGANISATION/$GITHUB_REPO_NAME/tarball/$GITHUB_BRANCH | tar xz -C $GITHUB_DESTINATION
fi

#wget --header="Authorization: token $GITHUB_TOKEN" --header="Accept:application/vnd.github.v3.raw" -O - https://api.github.com/repos/$GITHUB_ORGANISATION/$GITHUB_REPO_NAME/tarball/$GITHUB_BRANCH | tar xz -C $