# Use the node:16-buster image as a base
FROM node:bullseye

# Install necessary dependencies for Playwright
RUN apt-get update && apt-get install -y \
    # Playwright dependencies
    libgtk-3-0 \
    libgles2 \
    libnotify4 \
    libnss3 \
    libxss1 \
    libxtst6 \
    xdg-utils \
    libatspi2.0-0 \
    libuuid1 \
    libsecret-1-0 \
    libenchant-2-2 \
    # Your additional dependencies
    libavif-dev \
    libmanette-0.2-0 \
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
