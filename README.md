# Cameleer with docker

### 1. image build
```
docker build --tag cameleer . \
		--build-arg USERNAME=cameleer \
		--build-arg GROUPNAME=cameleer \
		--build-arg UID=1000 \
		--build-arg GID=1000 \
		--build-arg PASSWORD=cameleer
```


### 2. run
```
docker run --rm -it \
		--env DISPLAY=${DISPLAY} \
		--volume `pwd`:/home/cameleer/develop/ \
		--volume /tmp/.X11-unix:/tmp/.X11-unix \
		cameleer
```

#### (初回のみ). 必要なライブラリを入れる
`3. コンテナに入る`をした上で、
https://hackmd.io/gaXdDnzKQuS5Y2ER8ka39A?view
書いていただいたインストール手順の`cameleer`セクションのコマンドを打っていく.
`~/develop/cameleer`にいることを確認した上で,
```
opam init --yes --disable-sandboxing && eval $(opam env)
opam switch create --yes . && eval $(opam env)

opam install --yes alt-ergo altgr-ergo
#opam install z3
opam install --yes why3-coq
eval $(opam env)
why3 config detect
eval $(opam env)
```


#### 2回目以降
`~/develop/cameleer/`以下で,
```
eval $(opam env)
why3 config detect
```


### 3. 動作確認
`3. コンテナに入る`をした上で、
`~/develop/cameleer`にいることを確認した上で,
`cameleer smartcontracts/boomerang.ml`をして, GUIが立ち上がる事を確認.


![Screenshot from 2022-06-05 17-13-31](https://user-images.githubusercontent.com/63214188/172041775-7830e040-4acd-43f7-89e2-b75c798c4985.png)




