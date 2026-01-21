# Use Node.js LTS base image
FROM --platform=linux/amd64 node:lts-bookworm-slim

# Install dependencies required for fetching and running the binary
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install Gemini CLI globally
RUN npm install -g @google/gemini-cli

WORKDIR /app

# Build Argument for Release Version (e.g., v0.3.15)
ARG BRANCH_NAME=v0.3.15

# Download and extract the prebuilt binary
RUN echo "Downloading version ${BRANCH_NAME}..." && \
    curl -L -o gemini-web.tar.gz "https://github.com/Piebald-AI/gemini-cli-desktop/releases/download/${BRANCH_NAME}/gemini-cli-desktop-web-linux-x64-gnu.tar.gz" && \
    tar -xzf gemini-web.tar.gz && \
    rm gemini-web.tar.gz && \
    chmod +x gemini-cli-desktop-web

# Expose the port (The application defaults to 1858)
EXPOSE 1858

# Set host to 0.0.0.0 to ensure external access
ENV HOST=0.0.0.0

# Run the binary
CMD ["./gemini-cli-desktop-web"]