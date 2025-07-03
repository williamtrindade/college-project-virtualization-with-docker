
FROM node:18-alpine as build-stage
ARG GITHUB_REPO_URL
ARG APP_TOKEN
ARG VUE_APP_API_URL

RUN apk add --no-cache git
WORKDIR /app_source
RUN git clone --depth 1 ${GITHUB_REPO_URL}

WORKDIR /app_source/college-project-restaurant-management-system/finfood-vue
RUN echo "VUE_APP_API_URL=${VUE_APP_API_URL}" > .env.production
RUN echo "VUE_APP_TOKEN=${APP_TOKEN}" >> .env.production
RUN npm install
RUN NODE_OPTIONS=--openssl-legacy-provider npm run build

FROM httpd:2.4-alpine

COPY --from=build-stage /app_source/college-project-restaurant-management-system/finfood-vue/dist /usr/local/apache2/htdocs/

COPY apache.conf /usr/local/apache2/conf/httpd.conf
