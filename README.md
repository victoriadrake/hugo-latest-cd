# GitHub Action to build and deploy a Hugo site to GitHub Pages using latest extended Hugo 🚀

This action cleans and rebuilds your [Hugo site](https://gohugo.io/) to a destination folder in the same repository.

It always uses the latest extended version from [Hugo releases](https://github.com/gohugoio/hugo/releases). The extended version [enables the processing](https://gohugo.io/troubleshooting/faq/#i-get-tocss--this-feature-is-not-available-in-your-current-hugo-version) of SCSS and Sass files to CSS.

Your site will build in a destination folder in your repository, and that folder will be pushed back to `master`. To automatically serve your updated site with GitHub Pages, [choose the `docs/` folder as your source](https://help.github.com/en/github/working-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site).

The default destination folder is `docs/`.

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
        #env:
        #  HUGO_ARGS: '--minify'
        uses: victoriadrake/hugo-latest-cd@master
```

You may uncomment the `env` setting above to pass arbitrary [options](https://gohugo.io/commands/hugo/#options) to the `hugo` build command. See `man hugo` on your system for options.

## Use the workflow YAML file directly

If you prefer to place this action's YAML file in your repository directly, simply copy the included `hugo-latest-cd.yml` into your repository's `.github/workflows/` directory.

For help editing the YAML file, see [Workflow syntax for GitHub Actions](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/workflow-syntax-for-github-actions).
