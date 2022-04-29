FROM ruby:2.6.8-alpine AS base

RUN apk add --update --no-cache \
    postgresql-dev \
    tzdata

FROM base AS dependencies

RUN apk add --update --no-cache build-base

COPY Gemfile Gemfile.lock ./

RUN gem install nokogiri -v 1.12.4

RUN gem install bundler -v 2.3.8

RUN bundle install --jobs=3 --retry=3 --verbose

FROM base

WORKDIR /var/mini-seedrs-api

COPY --from=dependencies /usr/local/bundle/ /usr/local/bundle/

COPY . ./
