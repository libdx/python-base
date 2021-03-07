APP = app

.PHONY: clean

clean:
	find . -name '*.pyc' -exec rm --force {} +
	find . -name '*.pyo' -exec rm --force {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

run-dev:
	docker-compose up --build --detach

test:
	docker-compose exec $(APP) pipenv run test

cov:
	docker-compose exec $(APP) pipenv run cov

lint:
	docker-compose exec $(APP) pipenv run lint

fix:
	docker-compose exec $(APP) sh -c \
		"pipenv run fix && pipenv run isort"
