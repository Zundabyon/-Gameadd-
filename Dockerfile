FROM ruby:3.3

# pg のビルドに必要なもの全部入れる
RUN apt-get update -qq && apt-get install -y \
    nodejs \
    postgresql-client \
    libpq-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# bundle install 用
COPY Gemfile Gemfile.lock ./
RUN bundle install

# アプリ全体コピー
COPY . .
