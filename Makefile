DIR := ${CURDIR}
CURRENT_UID := $(shell id -u)
CURRENT_GID := $(shell id -g)

all: build copy

build:
	docker build -t alacritty .

copy:
	docker run --rm -v $(DIR):/out -u $(CURRENT_UID):$(CURRENT_GID) alacritty cp target/release/alacritty /out
	ls -la

clean:
	docker rmi -f alacritty
	docker rmi -f rust

