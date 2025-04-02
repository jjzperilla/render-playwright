# Use Playwright's official image with dependencies
FROM mcr.microsoft.com/playwright:v1.39.0-focal

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy project files
COPY . .

# Expose a port (change if needed)
EXPOSE 3000

# Start the application (adjust if needed)
CMD ["node", "index.js"]
