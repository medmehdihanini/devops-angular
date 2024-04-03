# Use the latest Node.js image as the base image
FROM node:latest AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Build the Angular app in production mode
RUN npm run build --prod

# Use Nginx image as the base image for serving Angular app
FROM nginx:alpine

# Copy built Angular app from previous stage
COPY --from=builder /app/dist/angular-app /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Command to run Angular app using Nginx
CMD ["nginx", "-g", "daemon off;"]
