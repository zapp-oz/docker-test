FROM node:12.19.0-alpine3.11 as builder

WORKDIR /home/app

COPY ./package.json ./
RUN npm i
COPY ./ ./

RUN npm run build

FROM nginx:1.18.0-alpine
EXPOSE 80
COPY --from=builder /home/app/build /usr/share/nginx/html
