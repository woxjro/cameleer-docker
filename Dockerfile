# syntax=docker/dockerfile:1
FROM ocaml/opam
RUN sudo apt-get update && \
		sudo apt-get install -y apt-utils libgmp-dev pkg-config
RUN opam install alt-ergo altgr-ergo
RUN opam install z3
RUN opam install why3-coq
RUN	why3 config detect



#WORKDIR /app
#COPY . .
#RUN yarn install --production
#CMD ["ls"]
#EXPOSE 3000
