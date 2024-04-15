FROM node:16 AS build

WORKDIR /app

COPY package*.json ./

RUN npm install -g @angular/cli@16

RUN npm install

COPY . .

RUN ng build 

FROM nginx:alpine

COPY --from=builder /app/dist/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
