FROM ruby:3.3

RUN apt-get update -qq && apt-get install -y \
    nodejs \
    npm

WORKDIR /app

COPY . .

RUN gem install bundler
RUN bundle install
# ✅ Renderが見るポートを指定
ENV PORT=3000

# ✅ ここが最重要：Railsサーバー起動命令
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
