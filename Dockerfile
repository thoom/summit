FROM ruby:alpine
MAINTAINER z.d.peacock <zdp@thoomtech.com>

RUN apk add --no-cache --update \
    build-base \
    libstdc++ \
    git \
    openssh \
    mariadb-dev \
    && gem install -N \
    sinatra \ 
    thin

COPY app /app
COPY start.sh /start.sh

EXPOSE 9000

WORKDIR /app
CMD ["sh", "/start.sh"]
