#!/bin/bash

# Disable Strict Host checking for non interactive git clones
mkdir -p -m 0700 /root/.ssh
echo -e "Host *\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

if [ ! -z "$SSH_KEY" ]; then
  echo $SSH_KEY > /root/.ssh/id_rsa.base64
  base64 -d /root/.ssh/id_rsa.base64 > /root/.ssh/id_rsa
  chmod 600 /root/.ssh/id_rsa
fi

cd /app

# Dont pull code down if the .git folder exists
if [ ! -d ".git" ]; then
  # Pull down code from git for our site!
  if [ ! -z "$GIT_REPO" ]; then
    # Remove the test index file
    rm -Rf /app/*
    if [ ! -z "$GIT_BRANCH" ]; then
      git clone -b $GIT_BRANCH $GIT_REPO /app
    else
      git clone $GIT_REPO /app
    fi
  fi
fi

if [ ! -f "config.ru" ]; then
  echo "config.ru missing"
  exit 1
fi

if [ -f "Gemfile" ]; then
  bundle install --without=development
fi

# Start thin
thin -R config.ru -p 9000 start
