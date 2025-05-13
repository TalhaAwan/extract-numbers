.PHONY: build check-dist publish validate test typecheck format check-format

SRC = extract_numbers tests

test:
	pytest

typecheck:
	mypy

format:
	ruff format $(SRC)

check-format:
	ruff format --check $(SRC)

validate: check-format typecheck test

build:
	rm -rf dist/ build/ *.egg-info
	python -m build

check-dist:
	twine check dist/*

publish: build check-dist
	twine upload dist/*
