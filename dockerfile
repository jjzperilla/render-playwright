# Use an official Node.js runtime as a parent image
FROM node:18-slim

# Install necessary libraries
RUN apt-get update && apt-get install -y \
    libgtk-4-1 \
    libgraphene-1.0-0 \
    libgstreamer1.0-0 \
    libgstreamer-plugins-base1.0-0 \
    libavif15 \
    libenchant-2-2 \
    libsecret-1-0 \
    libmanette-0.2-0 \
    libgles2 \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of your application files
COPY . .

# Install Playwright browsers
RUN PLAYWRIGHT_BROWSERS_PATH=./browsers npx playwright install

# Command to run your app
CMD ["npm", "start"]