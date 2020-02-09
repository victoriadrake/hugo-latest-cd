#!/bin/bash

echo '🤵 Install Hugo'
HUGO_VERSION=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | jq -r '.tag_name')
mkdir tmp/ && cd tmp/
curl -sSL https://github.com/gohugoio/hugo/releases/download/${HUGO_VERSION}/hugo_extended_${HUGO_VERSION: -6}_Linux-64bit.tar.gz | tar -xvzf-
mv hugo /usr/local/bin/
cd .. && rm -rf tmp/
cd ${GITHUB_WORKSPACE}
hugo version || exit 1

echo '🧹 Clean site'
if [ -d "docs" ]; then
    rm -rf docs/*
fi

echo '🍳 Build site'
hugo -d docs

echo '🚀 Deploy build'
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git add .
git commit -am "🚀 Deploy with ${GITHUB_WORKFLOW}"
git push --all -f https://${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git
