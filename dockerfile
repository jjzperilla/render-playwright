# Use a Playwright-ready image
FROM mcr.microsoft.com/playwright:v1.39.0-focal

WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy project files
COPY . .

# Expose necessary port
EXPOSE 3000

# Start the application
CMD ["node", "index.js"]
