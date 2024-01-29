
.PHONY: build

build:
	docker build --platform=linux/amd64 . -t "rjsheperd/clojure-bb-bun-chrome:latest"

run:
	docker run -it rjsheperd/clojure-bb-bun-chrome:latest /bin/bash

push: build
	docker push "rjsheperd/clojure-bb-bun-chrome:latest"
