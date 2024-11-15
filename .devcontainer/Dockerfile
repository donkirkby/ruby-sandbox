ARG UBUNTU_VERSION=20.04

FROM ubuntu:$UBUNTU_VERSION

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.3.4
ARG BUNDLER_VERSION=2.5.11
ARG DEBIAN_FRONTEND=noninteractive

ENV IN_DOCKER=true \
    NLS_LANG=AMERICAN_AMERICA.AL32UTF8

# Downgrade packages to allow ruby 2.2.2 and bundle install to run under ubuntu 20.04
RUN echo "deb http://security.ubuntu.com/ubuntu/ bionic-security main" >> /etc/apt/sources.list
RUN echo "deb http://security.ubuntu.com/ubuntu/ bionic main" >> /etc/apt/sources.list
RUN apt update
RUN apt-get install --no-install-recommends -y \
    libssl1.0-dev \
    gawk=1:4.1.4+dfsg-1build1 \
    bash-completion

RUN apt update && \
    apt-get install -y curl gpg libaio1 libaio-dev unzip rlwrap && \
    curl -sSL https://rvm.io/mpapis.asc | gpg --import - && \
    curl -sSL https://rvm.io/pkuczynski.asc | gpg --import - && \
    curl -sSL https://get.rvm.io | bash -s stable && \
    usermod -a -G rvm root

# Copy the gem files and install before adding more files.
EXPOSE 4567
WORKDIR /opt/ruby-sandbox
COPY new-ruby/Gem* /opt/ruby-sandbox/
COPY docker-requirements.sh /opt/ruby-sandbox/
RUN /opt/ruby-sandbox/docker-requirements.sh

# This will change with every build.
COPY . .
# Symbolic link to this file, the command `irb` looks for `~/.irbrc`, which is
# not the same place where we mount our development code into.
RUN ln -s /opt/ruby-sandbox/.irbrc ~/.irbrc
# These are to be kept at the end of the build process because they will change EVERY build.
ARG CI_BUILD_DATE="n/a"
ARG CI_BUILD_USER="n/a"
ARG CI_BUILD_COMMENTS="n/a"

ENV BUILD_DATE=${CI_BUILD_DATE} \
    BUILD_USER=${CI_BUILD_USER} \
    BUILD_COMMENTS=${CI_BUILD_COMMENTS}
LABEL BUILD_DATE=${CI_BUILD_DATE} \
    BUILD_USER=${CI_BUILD_USER} \
    BUILD_COMMENTS=${CI_BUILD_COMMENTS}
