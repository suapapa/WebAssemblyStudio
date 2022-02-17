FROM node:16 AS builder

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build
RUN rm -rf node_modules

FROM nginx:alpine

COPY --from=builder /app /usr/share/nginx/html