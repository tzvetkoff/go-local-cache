COMPOSE_PROJECT_NAME ?= go-cache

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

## Start local server
up:
	docker-compose --project-name=$(COMPOSE_PROJECT_NAME) up

## Stop local server
down:
	docker-compose --project-name=$(COMPOSE_PROJECT_NAME) down

## Remove local server leftovers
clean:
	rm -rf ./data

# vim:ft=make:ts=4:sts=4:noet
