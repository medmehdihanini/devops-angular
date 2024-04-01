# Use an official Node.js runtime as the base image
FROM node:14-alpine as build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire project to the working directory
COPY . .

# Build the Angular app
RUN npm run build --prod

# Use a smaller image for serving the Angular app
FROM nginx:alpine

# Copy the built Angular app from the build stage to the NGINX serving directory
COPY --from=build /app/dist/<your-angular-project-name> /usr/share/nginx/html

# Expose port 8085
EXPOSE 8085

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]
