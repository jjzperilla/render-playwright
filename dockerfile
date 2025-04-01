# Use official Playwright image
FROM mcr.microsoft.com/playwright:v1.41.1-focal

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Install Playwright with dependencies
RUN npx playwright install --with-deps

# Copy the rest of the application files
COPY . .

# Expose the port the app will run on
EXPOSE 8080

# Start the server
CMD ["node", "index.js"]
