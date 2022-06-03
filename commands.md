
Dockerfile -> Docker image -> Docker Container
		build				run

# build

docker build --tag my-ocaml-opam .

# run
docker run -it --name my-ocaml-opam-container my-ocaml-opam


//docker container create -it --name my-ocaml-opam-container my-ocaml-opam

# remove

docker rm my-ocaml-opam-container 

docker rmi

docker container prune
