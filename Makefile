DIR := ${CURDIR}
CURRENT_UID := $$(id -u)
CURRENT_GID := $$(id -g)

all: build copy

build:
	docker build -t alacritty .

copy:
	docker run --rm -v $(DIR):/out -u $(CURRENT_UID):$(CURRENT_GID) alacritty cp target/release/alacritty /out
	ls -la alacritty
	./alacritty --version

clean:
	docker rmi -f alacritty
	docker rmi -f rust

master:
	sed '/checkout/d' Dockerfile > Dockerfile.master
	docker build -f Dockerfile.master -t alacritty .
	$(MAKE) copy

check:
	-git clone https://github.com/alacritty/alacritty.git /tmp/alacritty
	-git --git-dir=/tmp/alacritty/.git pull
	@echo ""
	@echo ""
	@echo "latest alacritty version"
	@git --git-dir=/tmp/alacritty/.git describe --tags `git --git-dir=/tmp/alacritty/.git rev-list --tags --max-count=1`
	@echo ""
	@echo "current alacritty version"
	@alacritty --version | sed -e "s/^alacritty\s//g"
	@echo ""

