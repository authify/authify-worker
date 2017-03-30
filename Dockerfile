FROM ruby:2.3.3-alpine

ENV AUTHIFY_REDIS_HOST=redis
ENV AUTHIFY_QUEUE=mailer

RUN apk --no-cache upgrade \
    && apk --no-cache add git

RUN apk --no-cache add --virtual build-dependencies \
        build-base \
        ruby-dev

COPY . /app
RUN cd /app \
    && bundle install --jobs=4 \
    && apk del build-dependencies

RUN mkdir /ssl

RUN chown -R root:root /app \
    && rm -f /app/.travis.yml

USER nobody
WORKDIR /app

CMD QUEUE=$AUTHIFY_QUEUE bundle exec rake resque:work
