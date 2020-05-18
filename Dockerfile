FROM node:alpine as build

WORKDIR /var/html

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

FROM nginx
COPY --from=build /var/html/build ./usr/share/nginx/html
