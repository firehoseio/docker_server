FROM ubuntu:trusty
MAINTAINER Andy Shinn <andys@andyshinn.as>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q
RUN apt-get install -y -q git ruby ruby-dev ruby-bundler \
 libxslt1-dev libxml2-dev make g++

ADD . /firehose

RUN bundle install --without development test --gemfile /firehose/Gemfile

EXPOSE 7474

CMD firehose server -p $PORT
