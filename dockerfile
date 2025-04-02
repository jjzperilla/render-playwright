# Use the node:16-buster image as a base
FROM node:alpine

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

# Copy project files into the container
COPY . .

# Install Node.js dependencies
RUN npm install

# Install Playwright and the necessary browsers
RUN npx playwright install --with-deps

# Expose the port the app runs on
EXPOSE 8080

# Start the app
CMD ["node", "index.js"]
