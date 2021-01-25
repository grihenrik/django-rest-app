FROM python:3.7-alpine

LABEL maintainer="Henrik Gripenberg"

ENV PYTHONBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
ENV SECRET_KEY 'oq9(9=^ry@!+2+5b8(xdquo=e6lbjwstu@t&@%s9byyf@+cy2*'