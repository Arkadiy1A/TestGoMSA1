FRONT_END_BINARY=frontApp
BROKER_BINARY=brokerApp
FRONT_BINARY=frontApp
AUTH_BINARY=authApp
LOGS_BINARY=loggerServiceApp
MAIL_BINARY=mailerApp
LISTENER_BINARY=listenerApp

dockers_build_deploy: docker_deploy_broker docker_deploy_listener docker_deploy_authentication docker_deploy_logger docker_deploy_mail docker_deploy_front

docker_deploy_broker: build_broker
	cd ../broker-service && docker build -f broker-service.dockerfile -t arkadiyagapov/brokerapp:1.0.1 .
	docker push arkadiyagapov/brokerapp:1.0.1

docker_deploy_listener: build_listener
	cd ../listener-service && docker build -f listener-service.dockerfile -t arkadiyagapov/listenerapp:1.0.0 .
	docker push arkadiyagapov/listenerapp:1.0.0

docker_deploy_authentication: build_auth
	cd ../authentication-service && docker build -f authentication-service.dockerfile -t arkadiyagapov/authapp:1.0.0 .
	docker push arkadiyagapov/authapp:1.0.0

docker_deploy_logger: build_logs
	cd ../logger-service && docker build -f logger-service.dockerfile -t arkadiyagapov/loggerserviceapp:1.0.0 .
	docker push arkadiyagapov/loggerserviceapp:1.0.0

docker_deploy_mail: build_mail
	cd ../mail-service && docker build -f mail-service.dockerfile -t arkadiyagapov/mailserviceapp:1.0.0 .
	docker push arkadiyagapov/mailserviceapp:1.0.0

docker_deploy_front: build_front
	cd ../front-end && docker build -f front-end-service.dockerfile -t arkadiyagapov/frontapp:1.0.0 .
	docker push arkadiyagapov/frontapp:1.0.0

## up: starts all containers in the background without forcing build
up:
	@echo "Starting Docker images..."
	docker-compose up -d
	@echo "Docker images started!"

## up_build: stops docker-compose (if running), builds all projects and starts docker compose
up_build: build_broker build_auth build_front build_logs build_mail build_listener
	@echo "Stopping docker images (if running...)"
	docker-compose down
	@echo "Building (when required) and starting docker images..."
	docker-compose up --build -d
	@echo "Docker images built and started!"

## down: stop docker compose
down:
	@echo "Stopping docker compose..."
	docker-compose down
	@echo "Done!"

## build_broker: builds the broker binary as a linux executable
build_broker:
	@echo "Building broker binary..."
	cd ../broker-service && env GOOS=linux CGO_ENABLED=0 go build -o ${BROKER_BINARY} ./cmd/api
	@echo "Done!"

## build_listener: builds the listener binary as a linux executable
build_listener:
	@echo "Building listener binary..."
	cd ../listener-service && env GOOS=linux CGO_ENABLED=0 go build -o ${LISTENER_BINARY} .
	@echo "Done!"

## build_auth: builds the auth binary as a linux executable
build_auth:
	@echo "Building auth binary..."
	cd ../authentication-service && env GOOS=linux CGO_ENABLED=0 go build -o ${AUTH_BINARY} ./cmd/api
	@echo "Done!"

## build_auth: builds the auth binary as a linux executable
build_logs:
	@echo "Building logs binary..."
	cd ../logger-service && env GOOS=linux CGO_ENABLED=0 go build -o ${LOGS_BINARY} ./cmd/api
	@echo "Done!"

## build_mail: builds the mail binary as a linux executable
build_mail:
	@echo "Building mail binary..."
	cd ../mail-service && env GOOS=linux CGO_ENABLED=0 go build -o ${MAIL_BINARY} ./cmd/api
	@echo "Done!"

## build_front: builds the front end binary
build_front:
	@echo "Building front end binary..."
	cd ../front-end && env GOOS=linux CGO_ENABLED=0 go build -o ${FRONT_END_BINARY} ./cmd/web
	@echo "Done!"

## start: starts the front end
start: build_front
	@echo "Starting front end"
	cd ../front-end && ./${FRONT_END_BINARY} &

## stop: stop the front end
stop:
	@echo "Stopping front end..."
	@-pkill -SIGTERM -f "./${FRONT_END_BINARY}"
	@echo "Stopped front end!"