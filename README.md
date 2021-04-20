# calendso-docker

Setup files for calendso via docker, a self hosted event scheduling system.

## Requirements

-   a server with your own https domain  
    (subdomain like: https://meetme.<yourdomain.com> recommended)
-   ability to run docker containers on the server
-   docker-compose installed
-   a Google account

## Setup

1. Clone the repo
   ```sh
   git clone https://github.com/speckm/calendso-docker.git
   cd calendso-docker
   ```
2. Copy .env.example to .env file
   ```sh
   cp .env.example .env
   ```
3. Update user credentials and domain settings in .env file
4. Get Google-Authorization. Detailed description can be found here
	[calendso google setup](https://github.com/calendso/calendso#obtaining-the-google-api-credentials)
5. Update google credentials in .env file.
6. Start app with
   ```sh
   ./start.sh
   ```

## Start/Stop
You can start/update the service via
   ```sh
   docker-compose up --build -d
   ```
You can stop the service via
   ```sh
   docker-compose down
   ```
