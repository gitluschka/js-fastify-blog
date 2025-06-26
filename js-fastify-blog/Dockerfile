# Use official Node.js 20 LTS Alpine image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package manifest(s) and install dependencies
COPY package*.json ./
RUN npm ci

# Copy application source
COPY . .

# Build the project (webpack)
RUN npm run build

# Expose application port
EXPOSE 8080

# Default start command
CMD ["npm", "start"]
