FROM python:3.11-slim

ENV POETRY_VERSION=1.8.3

RUN pip install "poetry==$POETRY_VERSION"

WORKDIR /app
COPY pyproject.toml poetry.lock /app/

RUN poetry config virtualenvs.create false && poetry install --no-dev

COPY . /app

EXPOSE 3000

WORKDIR /app/dagster_user_code_example

CMD ["dagster", "api", "grpc", "-h", "0.0.0.0", "-p", "3000"]