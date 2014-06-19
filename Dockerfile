FROM ubuntu:trusty
MAINTAINER Andy Shinn <andys@andyshinn.as>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q
RUN apt-get install -y -q git ruby ruby-dev ruby-bundler \
 libxslt1-dev libxml2-dev make g++

ADD . /firehose
ADD ./start_firehose /usr/local/bin/start_firehose

RUN bundle install --without development test --gemfile /firehose/Gemfile

EXPOSE 7474

CMD start_firehose
