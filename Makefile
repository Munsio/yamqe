PROJECT := yamqe
BINDIR  := $(CURDIR)/bin
VERSION := `cat VERSION`

.PHONY: all
all: help

.PHONY: help
help:
	@echo "make test - run go test"
	@echo "make build - build yamqe"
	@echo "make build-travis - compiles binaries for x64 mac/linux and creates release tar.gz files with hashsums"

.PHONY: build

build:
	@scripts/build.sh $(VERSION)

build-travis: 
	$(eval FILES := $(shell ls build))
	@for f in $(FILES); do \
		(cd $(shell pwd)/build/$$f && tar -cvzf ../../dist/$$f.tar.gz *); \
		(cd $(shell pwd)/dist && shasum -a 256 $$f.tar.gz > $$f.sha256); \
		(cd $(shell pwd)/dist && md5sum $$f.tar.gz > $$f.md5); \
		echo $$f; \
	done

build-dir:
	@rm -rf build && mkdir build