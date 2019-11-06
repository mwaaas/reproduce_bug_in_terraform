with_docker="yes"

DOCKER_APP_RUN := $(shell [ $(with_docker) = yes ] && echo "docker-compose run --rm dev_tools" || echo "TF_LOG=TRACE TF_LOG_PATH=./terraform.log")
dynamodb_endpont := $(shell [ $(with_docker) = yes ] && echo "http://dynamodb-local-mock-unsupported-api:4567" || echo "http://localhost:8010")



services:
	docker-compose up -d --force-recreate dynamodb
	docker-compose up -d --no-recreate dynamodb-ui dynamodb-local-mock-unsupported-api

apply: delete_state_files
	$(DOCKER_APP_RUN) terraform apply -auto-approve -var dynamodb_endpont=$(dynamodb_endpont)

init:
	$(DOCKER_APP_RUN) terraform init

delete_state_files:
	rm -f terraform.tfstate
	rm -f terraform.tfstate.backup
	rm -f terraform.log

list_tables:
	aws --endpoint-url=http://localhost:8011 dynamodb list-tables


reset: services delete_state_files

deploy: reset apply list_tables

