FROM python:3.7-alpine

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

#limits the scope of malicious actors by stopping
#them having route access if Dockerfile is comprimised
RUN adduser -D user
USER user