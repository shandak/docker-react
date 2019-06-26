FROM node:alpine as builder

WORKDIR /app

# Download and install a dependency
COPY package.json .
RUN npm install
COPY ./public /app/public
COPY ./src /app/src
COPY ./build /app/build

CMD npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html