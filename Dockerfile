FROM ruby:3.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client npm

WORKDIR /app

RUN gem install bundler
RUN gem install rails
