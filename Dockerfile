FROM ruby:3.3

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y \
    nodejs \
    postgresql-client \
    libpq-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Gemfile 先行コピー & bundle install
COPY Gemfile Gemfile.lock ./
RUN bundle install

# アプリ全体コピー
COPY . .

# ポート設定
EXPOSE 3000

# デプロイ時に DB 作成＆マイグレーション → Puma 起動
CMD ["sh", "-c", "bundle exec rails db:create db:migrate && bundle exec puma -C config/puma.rb"]
