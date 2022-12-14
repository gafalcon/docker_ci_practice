FROM node:16-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
RUN chown -R node:node /app/node_modules
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
