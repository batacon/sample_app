FROM ruby:2.5.3

# Initialize
RUN apt-get update -qq && \
    apt-get install -y \
      build-essential \
      libpq-dev \
      postgresql-client \
      less \
      vim && \
      rm -rf /var/lib/apt/lists/*

# ENV
ENV APP_HOME=/var/www \
  LANG=C.UTF-8 \
  EDITOR=vim

# Rails and Webpack
WORKDIR $APP_HOME
COPY ./Gemfile* ./
RUN bundle install -j4
COPY ./ $APP_HOME/

RUN mkdir -p $APP_HOME/tmp/cache \
  $APP_HOME/tmp/pids \
  $APP_HOME/tmp/sockets

VOLUME $APP_HOME/tmp
