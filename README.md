# Cameleer with docker

### 1. image build
`docker build --tag cameleer .`


### 2. docker-compose
```
export USER_ID=$(id -u) && \
export GROUP_ID=$(id -g) && \
docker-compose up -d
```


### 3. コンテナに入る
`docker exec -it cameleer bash`

### (初回のみ) 4. 必要なライブラリを入れる
`3. コンテナに入る`をした上で、
https://hackmd.io/gaXdDnzKQuS5Y2ER8ka39A?view
書いていただいたインストール手順の`cameleer`セクションのコマンドを打っていく.
`/home/cameleer_with_docker/cameleer`にいることを確認した上で,
```
opam init && eval $(opam env)
opam switch create . ocaml-base-compiler.4.14.0 && eval $(opam env)
opam install alt-ergo altgr-ergo
opam install z3
opam install why3-coq
eval $(opam env)
why3 config detect
eval $(opam env)
```


### 5. 動作確認
`3. コンテナに入る`をした上で、
`/home/cameleer_with_docker/cameleer`にいることを確認した上で,
`cameleer smartcontracts/boomerang.ml`をして, GUIが立ち上がる事を確認.

