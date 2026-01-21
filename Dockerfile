# Use Node.js LTS (Bookworm Slim)
FROM node:22-bookworm-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    python3 \
    make \
    g++ \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Build Argument for Release Version
ARG BRANCH_NAME=main

# Clone the repository
# We clone into /app
RUN git clone https://github.com/Piebald-AI/gemini-CLI-desktop.git . && \
    git checkout $BRANCH_NAME

# Change to frontend directory where package.json is located
WORKDIR /app/frontend

# Install dependencies
RUN npm install

# Expose the application port (Vite default)
EXPOSE 5173

# Start the application in dev mode, exposed to network
# We pass --host to vite to ensure it binds to 0.0.0.0
CMD ["npm", "run", "dev", "--", "--host"]
