#! /bin/sh

# docker run -it --name code-server -p 127.0.0.1:8080:8080 \
#     -v "$PWD/.local:/home/coder/.local" \
#     -v "$PWD/.config:/home/coder/.config" \
#     -v "$PWD:/home/coder/project" \
#     -u "$(id -u):$(id -g)" \
#     -e "DOCKER_USER=$USER" \
#     codercom/code-server:latest

# reset env
rm .env && touch .env
echo "UID=$(id -u)" > .env
echo "GID=$(id -g)" >> .env
echo "USER=$USER" >> .env
echo "WORKDIR=$PWD" >> .env

docker compose up
