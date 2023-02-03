FROM node:18-alpine As build
WORKDIR /usr/src/app
RUN apk add python3 \
  && apk add make \
  && apk add g++

COPY --chown=node:node package*.json ./
RUN npm ci
# COPY --chown=node:node . .
# RUN npm run build

# ENV NODE_ENV production
# RUN npm ci --omit=dev && npm cache clean --force

USER node
