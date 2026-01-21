# Gemini CLI Web Docker

This repository contains the Docker setup to run the frontend of [Gemini CLI Desktop](https://github.com/Piebald-AI/gemini-CLI-desktop) in a container.

## Prerequisites

- Docker
- Docker Compose

## Usage

1.  Build and start the container:

    ```bash
    docker-compose up -d --build
    ```

2.  Access the web interface at [http://localhost:5173](http://localhost:5173).

## Configuration

You can change the target branch by modifying the `BRANCH_NAME` build argument in the `Dockerfile` or passing it during build.
