FROM rocker/tidyverse:3.5.1

# install dependency package
RUN set -x && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    apt-transport-https \
    curl \
    gnupg \
    libssl-dev

# "install nodejs. Use instead of 'curl -L git.io/nodebrew | perl - setup'" && \
RUN set -x && \
  curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - && \
  apt-get install -y --no-install-recommends \
    nodejs

# install yarn
RUN set -x && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    apt-transport-https \
    yarn && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN set -x && \
  install2.r --error \
    here \
    usethis && \
  rm -rf /tmp/downloaded_packages/ /tmp/*.rds
