#!/bin/bash

# Fail if variables are unset
set -eu -o pipefail

echo '🔧 Install tools'
npm init -y && npm install -y postcss-cli autoprefixer

echo '🤵 Install Hugo'
HUGO_VERSION='v0.109.0'
mkdir tmp/ && cd tmp/
curl -sSL https://github.com/gohugoio/hugo/releases/download/${HUGO_VERSION}/hugo_extended_${HUGO_VERSION: -7}_Linux-64bit.tar.gz | tar -xvzf-
mv hugo /usr/local/bin/
cd .. && rm -rf tmp/
cd ${GITHUB_WORKSPACE}
hugo version || exit 1

echo '🧹 Clean site'
if [ -d "${DEST:-"docs"}" ]; then
    rm -rf ${DEST:-"docs"}/*
fi

echo '🍳 Build site'
hugo ${HUGO_ARGS:-""} -d ${DEST:-"docs"}

echo '🚀 Deploy build'
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git add .
git commit -am "🚀 Deploy with ${GITHUB_WORKFLOW}"
git push --all -f https://${TOKEN}@github.com/${GITHUB_REPOSITORY}.git
