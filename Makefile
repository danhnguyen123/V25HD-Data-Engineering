####################################################################################################################
# Setup containers to run Airflow
NETWORK_NAME=data-network

init:
	@echo "Run init project"
	@chmod +x ./scripts/init_project.sh
	@./scripts/init_project.sh $(NETWORK_NAME)
	@echo "Run init project complete"

up:
	@echo "Spin up Airflow"
	@cd ./airflow && docker compose up -d --build && cd ..
	@echo "Spin up Airflow complete"

## Airflow Webserver

ui:
	open http://localhost:8080

down:
	@echo "Shutdown Airflow"
	@cd ./airflow && docker compose down && cd ..
	@echo "Shutdown Airflow complete"

deploy: init up

restart: down up