FROM polleverywhere/ruby:2.1.2

RUN apt-get -q update \
  && apt-get -q -y install git libxslt1-dev libxml2-dev make g++ libssl1.0.0 \
  && apt-get -q -y clean \
  && rm -rf /var/lib/apt/lists

WORKDIR /firehose

ADD Gemfile /firehose/Gemfile
ADD Gemfile.lock /firehose/Gemfile.lock

RUN bundle install \
  --binstubs \
  --retry 3 \
  --jobs 4 \
  --without test development

ADD . /firehose

ENV REDIS_URL redis://redis:6379/0
ENV PORT 7474

EXPOSE 7474

CMD bin/firehose server -p $PORT
