FROM ruby:2.7
RUN apt-get update -qq && apt-get install -y build-essential curl git-core openssl \
    libssl-dev libcurl4-openssl-dev zlib1g zlib1g-dev libpq-dev \
    nodejs postgresql-client
RUN curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y yarn
RUN mkdir /app
WORKDIR /app

COPY Gemfile* /app/
COPY package.json /app/package.json
COPY yarn.lock /app/yarn.lock
RUN bundle install

COPY babel.config.js /app/babel.config.js
RUN yarn install
