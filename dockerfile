# Use the official Node.js image as a base
FROM node:16 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Angular CLI globally
RUN npm install -g @angular/cli@16

# Install project dependencies
RUN npm install

# Copy the entire application source code to the working directory
COPY . .

# Build the Angular app for production
RUN ng build 

# Expose port 4200 for incoming HTTP traffic
EXPOSE 4200

# Start the Angular development server when the container starts
CMD ["ng", "serve"]
