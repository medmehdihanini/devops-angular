

FROM node:latest as builder
WORKDIR /app
COPY package.json ./
RUN npm install -g @angular/cli
#RUN npm install
COPY . .
RUN ng build
FROM nginx:alpine
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
