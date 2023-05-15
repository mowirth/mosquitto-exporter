PROJ=ffe
export GOBIN=$(PWD)/bin

.PHONY: build
default: build
build:
	@mkdir -p bin/
	@go install -v -ldflags "-w -X main.Version=$(VERSION)" ./...
clean:
	@rm -rf bin/
