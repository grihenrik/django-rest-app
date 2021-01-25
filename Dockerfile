FROM python:3.7-alpine

LABEL maintainer="Henrik Gripenberg"

ENV PYTHONBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
        gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps
RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
ENV SECRET_KEY 'oq9(9=^ry@!+2+5b8(xdquo=e6lbjwstu@t&@%s9byyf@+cy2*'