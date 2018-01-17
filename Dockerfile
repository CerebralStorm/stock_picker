FROM ruby:2.4.3

RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && apt-get install -y nodejs

RUN mkdir -p /usr/src/app
ADD Gemfile /usr/src/app/
ADD Gemfile.lock /usr/src/app/
ADD package.json /usr/src/app/

WORKDIR /usr/src/app
ENV RAILS_ENV test
RUN bundle install --system
RUN npm install

ADD . /usr/src/app/
