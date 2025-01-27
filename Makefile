GOARCH = amd64

UNAME = $(shell uname -s)

ifndef OS
	ifeq ($(UNAME), Linux)
		OS = linux
	else ifeq ($(UNAME), Darwin)
		OS = darwin
	endif
endif

.DEFAULT_GOAL := all

all: fmt build start

build:
	GOOS=$(OS) GOARCH="$(GOARCH)" go build -o vault/plugins/vault-plugin-secrets-keycloak cmd/vault-plugin-secrets-keycloak/main.go

clean:
	rm -f ./vault/plugins/vault-plugin-secrets-keycloak

fmt:
	go fmt $$(go list ./...)

.PHONY: build clean fmt start enable
