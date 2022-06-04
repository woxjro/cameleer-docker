
Dockerfile -> Docker image -> Docker Container
		build				run

# build

docker build --tag cameleer .

# remove

docker rm my-ocaml-opam-container 

docker rmi

docker container prune

docker build --tag my-ocaml-opam . && \
docker rm my-ocaml-opam-container && \
docker run -it \
		--name my-ocaml-opam-container \
		my-ocaml-opam

		-v cameleer:/home \

USER_NAME=$(id -un) \
USER_ID=$(id -u) \
GROUP_NAME=$(id -gn) \
GROUP_ID=$(id -g) \
sudo -E docker-compose up -d


UID=${UID} GID=${GID} docker-compose up


# docker-compose
docker-compose up --detach --force-recreate

docker exec -it cameleer bash

export USER_ID=$(id -u) && \
export GROUP_ID=$(id -g) && \
docker-compose up -d


