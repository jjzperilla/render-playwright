# Use an official Node.js runtime as a parent image
FROM node:16-slim

# Install necessary dependencies for Playwright
RUN apt-get update && apt-get install -y \
    libgtk-4-1 \
    libavif-dev \
    libenchant-2-2 \
    libsecret-1-0 \
    libmanette-0.2-0 \
    libGLESv2-2 \
    && rm -rf /var/lib/apt/lists/*

# Set working directory inside the container
WORKDIR /app

# Copy your project files into the container
COPY . .

# Install project dependencies
RUN npm install

# Install Playwright and the necessary browser binaries
RUN npx playwright install --with-deps

# Expose the port your app will run on
EXPOSE 8080

# Command to start your application
CMD ["node", "index.js"]
