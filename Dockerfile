# Use Debian-based Node.js 20 LTS slim image for full build toolchain support
FROM node:20-slim

# Set working directory
WORKDIR /app

# Install build dependencies for native modules
RUN apt-get update && apt-get install -y python3 make g++ \
    && ln -sf /usr/bin/python3 /usr/bin/python

# Copy package manifest(s)
COPY package*.json ./

# Install dependencies: if lockfile exists — npm ci; otherwise npm install
RUN if [ -f package-lock.json ]; then \
      npm ci; \
    else \
      npm install; \
    fi

# Copy application source
COPY . .

# Build the project
RUN npm run build

# Remove build dependencies and clean up
RUN apt-get remove -y make g++ \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Expose application port
EXPOSE 8080

# Default start command
CMD ["npm", "start"]
