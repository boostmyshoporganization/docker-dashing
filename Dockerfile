# Use the latest Ubuntu base image
FROM ubuntu:latest
MAINTAINER Guillaume Dievart <dievartg@gmail.com>

# Silence debconf's endless prattle
ENV DEBIAN_FRONTEND noninteractive

# Install and set up packages
RUN apt-get update && apt-get install -y \
    libssl-dev \
    ruby-dev \
    nodejs \
    bundler \
    rubygems-integration

# Install dashing with gem
RUN gem install dashing

CMD cd /var/dashboard && bundle && dashing start
