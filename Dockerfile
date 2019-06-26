FROM node:alpine as builder

WORKDIR /app

# Download and install a dependency
COPY package.json ./
RUN npm install
COPY ./ ./

CMD npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html