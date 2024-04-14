FROM node:16 AS build

WORKDIR /app

COPY package*.json ./

RUN npm install -g @angular/cli@16

RUN npm install

COPY . .

RUN ng build 

EXPOSE 4200

CMD ["ng", "serve"]
