FROM ruby:2.4-alpine3.6
LABEL maintainer="christian.heimke@loumaris.com"

RUN apk update && apk --update add --virtual build-dependencies build-base postgresql-dev linux-headers \
    && apk add tar openssl 'postgresql=>9.6.0'

RUN gem install backup -v '5.0.0.beta.2' \
    && gem install rufus-scheduler tzinfo-data

RUN apk del build-dependencies

ADD Backup /backup

WORKDIR /backup

CMD ruby ./scheduler.rb