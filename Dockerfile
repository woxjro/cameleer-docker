# syntax=docker/dockerfile:1
FROM ocaml/opam:ubuntu-18.04-ocaml-4.14

WORKDIR /home/cameleer_with_docker/cameleer

#for opam switch
RUN sudo apt-get update && \
		sudo apt-get install -y pkg-config libcairo2-dev libexpat1-dev libgtk-3-dev libgtksourceview-3.0-dev

#for opam install alt-ergo altgr-ergo
RUN sudo apt-get update && \
		sudo apt-get install -y autoconf && \
		sudo apt-get install -y libexpat1-dev && \
		sudo apt-get install -y libgmp-dev && \
		sudo apt-get install -y libgtk2.0-dev && \
		sudo apt-get install -y libgtksourceview2.0-dev


#RUN opam init && \
#		eval $(opam env)
#RUN opam switch create . ocaml-base-compiler.4.14.0 && \
#		eval $(opam env)
#RUN opam install alt-ergo altgr-ergo
#RUN opam install z3
#RUN opam install why3-coq
#RUN	why3 config detect
