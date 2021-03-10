.PHONY: keys private.key public.key requirements.txt requirements-dev.txt

APP = jwty_mcjwt_face
POETRY_VERSION = 1.1.5
TEST = poetry run pytest -x -s -rA --durations=10 -vv --cov $(APP) tests

all: poetry install pre-commit

a-jwt:
	poetry run python scripts/$@

bump-major:
	poetry run bumpversion major

bump-minor:
	poetry run bumpversion minor

bump-patch:
	poetry run bumpversion patch

bump-reset:
	git reset HEAD~1

clean:
	find ./ -type d -name *__pycache__ -exec rm -rf {} \;
	rm .coverage coverage.xml
	rm -rf .pytest_cache htmlcov

cov-reports:
	$(TEST) --cov-report html

cover: cov-reports
	open htmlcov/index.html

cover-codacy: cov-reports
	poetry run coverage xml
	source .env && poetry run python-codacy-coverage -r coverage.xml

keys: private.key public.key

install:
	poetry install

lint: pre-commit
	poetry run flake8 gunicorn.conf.py

lint-vulnerability:
	poetry run safety check

poetry:
	curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/$(POETRY_VERSION)/get-poetry.py | python

pre-commit:
	pre-commit run --all-files

pre-commit-update:
	pre-commit autoupdate

private.key:
	openssl genrsa -out $@ 4096

public.key: private.key
	openssl rsa -in $< -pubout -outform PEM -out $@

release:
	git push && git push --tags

run-local:
	poetry run gunicorn -c gunicorn.conf.py jwty_mcjwt_face.app:api

test:
	$(TEST)
