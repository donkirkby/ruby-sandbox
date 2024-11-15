#!/bin/bash

source /etc/profile.d/rvm.sh

rvm requirements
echo installing ruby $RUBY_VERSION ...
pwd
ls
rvm install $RUBY_VERSION
rvm rvmrc warning ignore /opt/ruby-sandbox/Gemfile
gem install bundler -v "${BUNDLER_VERSION}"
bundle install
