FROM node:12.5.0-alpine

ENV HOME="/app" \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo

ENV HOST 0.0.0.0

WORKDIR ${HOME}

ARG API_KEY
ENV API_KEY ${API_KEY}

ARG AUTH_DOMAIN
ENV AUTH_DOMAIN ${AUTH_DOMAIN}

ARG PROJECT_ID
ENV PROJECT_ID ${PROJECT_ID}

ARG DATABASE_URL
ENV DATABASE_URL ${DATABASE_URL}

ARG STORAGE_BUCKET
ENV STORAGE_BUCKET ${STORAGE_BUCKET}

ARG MESSAGE_SENDER_ID
ENV MESSAGE_SENDER_ID ${MESSAGE_SENDER_ID}

ARG VUE_APP_HOTPEPPER_API_KEY
ENV VUE_APP_HOTPEPPER_API_KEY ${VUE_APP_HOTPEPPER_API_KEY}

RUN echo API_KEY
RUN echo ${API_KEY}

RUN echo API_KEY > .env
RUN echo PROJECT_ID >> .env
RUN echo AUTH_DOMAIN >> .env
RUN echo DATABASE_URL >> .env
RUN echo STORAGE_BUCKET >> .env
RUN echo MESSAGE_SENDER_ID >> .env
RUN echo VUE_APP_HOTPEPPER_API_KEY >> .env

RUN cat .env


COPY package.json .
COPY . .

RUN apk update && \
    apk upgrade && \
    npm install -g n && \
    yarn install &&\
    rm -rf /var/cache/apk/*

RUN yarn run build

EXPOSE 3000

#CMD ["yarn", "dev"]
CMD ["yarn", "start"]
