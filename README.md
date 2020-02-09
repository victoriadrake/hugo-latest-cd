# GitHub Action to build and deploy a Hugo site to GitHub Pages using latest extended Hugo 🚀

This action cleans and rebuilds your [Hugo site](https://gohugo.io/) to `docs/` in the same repository.

It always uses the latest extended version from [Hugo releases](https://github.com/gohugoio/hugo/releases). The extended version [enables the processing](https://gohugo.io/troubleshooting/faq/#i-get-tocss--this-feature-is-not-available-in-your-current-hugo-version) of SCSS and Sass files to CSS.

Your site will build in `docs/` in your repository, and `docs/` will be pushed back to `master`. To automatically serve your updated site with GitHub Pages, [choose the `docs/` folder as your source](https://help.github.com/en/github/working-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site).

## Add action to your workflow

Here is an example workflow file that uses this action on any `push` event to the `master` branch:

```yml
name: hugo-latest-cd

on:
  push:
    branches:
      - master

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
      - name: 🛎 Check out master
        uses: actions/checkout@master
        with:
          fetch-depth: 1
      - name: 🚀 Build and deploy
        uses: victoriadrake/hugo-latest-cd@master
```

## Use the workflow YAML file directly

If you prefer to place this action's YAML file in your repository directly, simply copy the included `hugo-latest-cd.yml` into your repository's `.github/workflows/` directory.

For help editing the YAML file, see [Workflow syntax for GitHub Actions](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/workflow-syntax-for-github-actions).
