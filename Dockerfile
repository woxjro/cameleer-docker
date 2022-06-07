FROM ubuntu:21.10

RUN apt update \
  && apt-get install -y --no-install-recommends sudo


ARG USERNAME
ARG GROUPNAME

ARG UID
ARG GID

ARG PASSWORD

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN groupadd --gid $GID $GROUPNAME && \
    useradd --create-home --shell /bin/bash --uid $UID --gid $GID --groups sudo $USERNAME && \
	echo $USERNAME:$PASSWORD | chpasswd && \
    echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USERNAME
WORKDIR /home/$USERNAME/develop/

#for opam switch
RUN sudo apt-get update && \
		sudo apt-get install -y pkg-config libcairo2-dev libexpat1-dev libgtk-3-dev libgtksourceview-3.0-dev


#install GCC and OPAM
RUN sudo apt-get update
RUN sudo apt-get install -y bubblewrap build-essential curl git m4 unzip
RUN sudo apt-get install -y opam
RUN opam init -y --disable-sandboxing
RUN eval $(opam env --switch=default)


#for opam install alt-ergo altgr-ergo
RUN sudo apt-get update && \
        sudo apt-get install -y autoconf && \
        sudo apt-get install -y libexpat1-dev && \
        sudo apt-get install -y libgmp-dev && \
        sudo apt-get install -y libgtk2.0-dev && \
        sudo apt-get install -y libgtksourceview2.0-dev

#RUN opam init && \
#        eval $(opam env) && \
#        opam switch create . ocaml-base-compiler.4.14.0 && \
#        eval $(opam env) && \
#        opam install alt-ergo altgr-ergo && \
#        opam install z3 && \
#        eval $(opam env) && \
#        opam install why3-coq && \
#        eval $(opam env) && \
#        why3 config detect
