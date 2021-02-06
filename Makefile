TOP_DIR ?= $(shell echo "${PWD}")
UID ?= $(shell id -u)
GID ?= $(shell id -g)

.PHONY: help

## Print this message and exit
help:
	@cat $(MAKEFILE_LIST) | awk '														\
		/^([0-9a-z-]+):[0-9a-z -]*$$/ {													\
			if (description[0] != "") {													\
				printf("\x1b[36mmake %s\x1b[0m\n", substr($$1, 0, length($$0)-1));		\
				for (i in description) {												\
					printf("| %s\n", description[i]);									\
				}																		\
				printf("\n");															\
				split("", description);													\
				descriptionIndex = 0;													\
			}																			\
		}																				\
		/^##/ {																			\
			description[descriptionIndex++] = substr($$0, 4);							\
		}																				\
	'

## Build local server
build:
	docker build --tag='go-cache:latest' '$(TOP_DIR)'

## Start local server
up:
	docker run --network='host' --user='$(UID):$(GID)' --env-file='$(TOP_DIR)/.env' --mount='type=bind,source=$(TOP_DIR)/data,destination=/data' 'go-cache:latest'

## Stop local server
down:
	docker kill '$(shell docker ps --quiet --filter 'ancestor=go-cache:latest')'

## Remove local server leftovers
clean:
	rm -rf '$(TOP_DIR)/data' && mkdir -p '$(TOP_DIR)/data' && touch '$(TOP_DIR)/.keep'

# vim:ft=make:ts=4:sts=4:noet
