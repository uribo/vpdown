#' The \pkg{vpdown} package
#'
NULL

vpdown_skeleton <- function(path, ...) {

  dir.create(here::here(path, "docs", ".vuepress"),
             recursive = TRUE)

  # nolint start
  writeLines('---\ntitle: \"vpdown\"\nhome: true\noutput:\n  html_document:\n    keep_md: true\n---\n\n```{r setup, include=FALSE}\nknitr::opts_chunk$set(echo = TRUE)\n```\n\nhi\n\n```{r}\nlibrary(vpdown)\n```\n\n\n```{r, eval = FALSE, echo = TRUE}\ninstall_vuepress(global = FALSE)\n```\n\n\n```{r, eval = FALSE, echo = TRUE}\nrender_site()\n```\n\n$J \\left( \\theta_0, \\theta_1 \\right) = \\frac{1}{2m}\\sum\\limits_{i=1}^m \\left( h_{\\theta}(x^{(i)})-y^{(i)} \\right)^{2}$',
             con = here::here(path, "README.Rmd"))
  writeLines('{\n  \"devDependencies\": {\n    \"markdown-it-katex\": \"^2.0.3\",\n    \"vuepress\": \"^0.14.4\"\n  }\n}',
             con = here::here(path, "package.json"))
  writeLines("module.exports = {\n\n  title: 'Hello, vpdown',\n  description: 'Vue-powered Static Site Generator with R Markdown',\n  head: [[\n    'link', \n    { rel: 'stylesheet', href: 'https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.5.1/katex.min.css' },\n    { rel: 'stylesheet', href: 'https://cdn.jsdelivr.net/github-markdown-css/2.2.1/github-markdown.css' },\n    ]],\n\n  themeConfig: {\n    nav: [\n      { text: \"Home\", link: \"/\" }\n    ],\n    \n    repo: 'uribo/vpdown',\n    repoLabel: 'GitHub',\n    docsRepo: 'uribo/vpdown-demo',\n    docsDir: 'docs',\n    editLinks: true,\n    editLinkText: 'Edit Page',\n    lastUpdated: 'Last Updated'\n  },\n\n  markdown: {\n    // options for markdown-it-anchor\n    anchor: { permalink: false },\n    config: md => {\n      md.use(require(\"markdown-it-katex\"));\n    }\n  }\n};\n",
             con = here::here(path, "docs", ".vuepress", "config.js"))
  # nolint end

  # Collect input parameters
  dots <- list(...)
  if (dots[[1]] == "in project")
    install_vuepress(global = FALSE, dir = path)
  if (dots[[1]] == "global")
    install_vuepress(global = TRUE, dir = path)
}
