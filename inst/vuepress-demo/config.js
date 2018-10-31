module.exports = {

  title: 'Hello, vpdown',
  description: 'Vue-powered Static Site Generator with R Markdown',
  head: [[
    'link', 
    { rel: 'stylesheet', href: 'https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.5.1/katex.min.css' },
    { rel: 'stylesheet', href: 'https://cdn.jsdelivr.net/github-markdown-css/2.2.1/github-markdown.css' },
    ]],

  themeConfig: {
    nav: [
      { text: "Home", link: "/" }
    ],
    
    repo: 'uribo/vpdown',
    repoLabel: 'GitHub',
    docsRepo: 'uribo/vpdown-demo',
    docsDir: 'docs',
    editLinks: true,
    editLinkText: 'Edit Page',
    lastUpdated: 'Last Updated'
  },

  markdown: {
    // options for markdown-it-anchor
    anchor: { permalink: false },
    config: md => {
      md.use(require("markdown-it-katex"));
    }
  }
};

