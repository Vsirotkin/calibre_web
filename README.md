Calibre-Web Docker Deployment

Prerequisites
Docker installed on your system.

A Calibre e-book library or a directory containing e-books.

Configuration
The provided Docker Compose file (docker-compose.yml) sets up the Calibre-Web service with the following configurations:

Docker Compose Version:
3.8

Services:
calibre-web:
    image: lscr.io/linuxserver/calibre-web:latest
    container_name: calibre-web
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
      - DOCKER_MODS=linuxserver/mods:universal-calibre #optional
      - OAUTHLIB_RELAX_TOKEN_SCOPE=1 #optional
    volumes:
      - /home/vik/Calibre Library:/books
    ports:
      - 8083:8083
    restart: unless-stopped

Image: Specifies the Docker image to use for the service.

Container Name: Sets a name for the Docker container.

Environment Variables:

PUID and PGID: User and group IDs for file permissions.

TZ: Timezone setting.

DOCKER_MODS: Enables Docker mods for additional functionality.

OAUTHLIB_RELAX_TOKEN_SCOPE: Relax token scope for OAuth.

Volumes: Maps the host directory containing the Calibre e-book library to the /books directory inside the container.

Ports: Maps port 8083 on the host to the same port inside the container.

Restart Policy: Ensures the container restarts unless explicitly stopped.

Usage:
Clone or copy the Docker Compose file to your local system.

Edit the volumes section if necessary, to point to your actual Calibre e-book library path.

Run the Docker Compose command:
docker-compose up -d
Access Calibre-Web: Open a web browser and go to http://localhost:8083.

Notes
Ensure that the user specified by PUID and PGID has the necessary permissions to access the e-book library.

Adjust the timezone (TZ) if needed.

The DOCKER_MODS and OAUTHLIB_RELAX_TOKEN_SCOPE environment variables are optional and can be removed if not needed.

Support
For any issues or questions, refer to the LinuxServer.io documentation or the Calibre-Web GitHub repository.
