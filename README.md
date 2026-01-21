# Gemini CLI Web Docker

This repository runs the **prebuilt** web server binary of [Gemini CLI Desktop](https://github.com/Piebald-AI/gemini-CLI-desktop) in a Docker container.

## Prerequisites

- Docker
- Docker Compose

## Usage

1.  Build and start the container:

    ```bash
    docker-compose up -d --build
    ```

2.  Access the web interface at [http://localhost:3000](http://localhost:3000).

## Configuration

- **Version**: Change the `BRANCH_NAME` build argument in `docker-compose.yml` or `Dockerfile` to target a different release version (e.g., `v0.3.15`).

- **Port**: The application runs on port `1858` inside the container. The `docker-compose.yml` maps host port `3000` to container port `1858`. You can change the host port by modifying the `ports` section in `docker-compose.yml`.
- **Projects**: The `../` directory is mounted to `/root/Projects` in the container for easy project access.
- **Config**: The host's `/Users/cye/.gemini` directory is mounted to `/root/.gemini` to share CLI configurations.
