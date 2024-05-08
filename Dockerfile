# Specify a base image
FROM node:16-alpine as builder

WORKDIR '/app'

# Install some dependencies
COPY ./package.json ./
RUN npm install
Copy ./ ./

# Default command
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html