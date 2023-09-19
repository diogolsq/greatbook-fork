FROM ruby:2.6.1

# Update source list to use archive URLs
RUN echo "deb http://archive.debian.org/debian/ stretch main contrib non-free" > /etc/apt/sources.list \
    && echo "deb-src http://archive.debian.org/debian/ stretch main contrib non-free" >> /etc/apt/sources.list

# Install https transport for apt
RUN apt-get update && apt-get install -y apt-transport-https

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list

# Run apt-get update now
RUN apt-get update && apt-get install -y --no-install-recommends postgresql-client nodejs yarn


RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler:2.2.32

RUN bundle config set --local force_ruby_platform true
RUN bundle install

EXPOSE 3000
CMD rails s -b 0.0.0.0
