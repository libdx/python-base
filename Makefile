APP = app
PROJECT = project
TESTS = tests

.PHONY: clean

clean:
	find . -name '*.pyc' -exec rm --force {} +
	find . -name '*.pyo' -exec rm --force {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

run-dev:
	docker-compose up --build --detach

test:
	docker-compose exec $(APP) \
		pytest $(TESTS) -p no:warnings

cov:
	docker-compose exec $(APP) \
		pytest $(TESTS) -p no:warnings --cov=$(PROJECT)

lint:
	docker-compose exec $(APP) flake8 $(PROJECT)

fix:
	docker-compose exec $(APP) sh -c \
		"black $(PROJECT) && isort $(PROJECT)
