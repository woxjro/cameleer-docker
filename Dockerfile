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

CMD ["/bin/bash"]

#RUN opam init && \
#		eval $(opam env) && \
#		opam switch create . ocaml-base-compiler.4.14.0 && \
#		eval $(opam env) && \
#		opam install alt-ergo altgr-ergo && \
#		opam install z3 && \
#		eval $(opam env) && \
#		opam install why3-coq && \
#		eval $(opam env) && \
#		why3 config detect
