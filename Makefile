SHELL = /bin/bash -eo pipefail

.PHONY: install-link-check link-check build-container docker-link-check

install-link-check:
	npm install -g markdown-link-check

link-check:
	@if ! which markdown-link-check > /dev/null;\
	then \
		echo "markdown-link-check not in PATH. Install it with 'make install-link-check'" ;\
		exit 1 ;\
	fi
	markdown-link-check README.md

build-container:
	docker build -t link-check .

docker-link-check: build-container
	docker run link-check make link-check
