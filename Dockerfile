FROM ruby:3.1.2-alpine3.15

RUN apk add --no-cache --update build-base cmake

WORKDIR /usr/src/app
ENV APP_ENV=production
ENV RACK_ENV=production

COPY Gemfile Gemfile.lock ./

RUN gem install bundler:2.3.4 && \
    bundle config set deployment 'true' && \
    bundle config set without 'development test' && \
    bundle install

# Copy the source as late as possible to maximize cache
COPY . .

ENTRYPOINT bundle exec rackup -p 3333 --host 0.0.0.0