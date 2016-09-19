# ================================================
# Dockerfile for yunojuno/node
# ================================================
#
# This is a basic container that can be used to build
# frontend build systems that use Node and npm.
#
# It contains Node and npm.
#
# Finally it contains vim, because config.
# ================================================
FROM ubuntu:14.04

MAINTAINER Hugo Rodger-Brown <hugo@yunojuno.com>

# run all this on a single command so that we get a single layer
RUN apt-get update;\
    apt-get install -y curl git vim;\
    curl -sL https://deb.nodesource.com/setup_6.x | sudo bash -;\
    apt-get install -y nodejs;\
    npm i -g npm@latest

# You should build on this image by adding in your own packages:
# FROM yunojuno/node

# # We want to use bower and grunt from the command line,
# # so need to install globally and not via package.json
# RUN npm install --global grunt-cli bower
#
# # Phantomjs is ubiquitous in frontend build systems, and
# # it has a hidden dependency libfreetype6 libfontconfig:
# # https://github.com/ariya/phantomjs/issues/10904
# RUN apt-get install libfreetype6 libfontconfig
#
# # Add local project node dependencies
# ADD package.json .
# RUN npm install
#
# # Add local project bower dependencies
# ADD bower.json .
# RUN bower install --allow-root
#
