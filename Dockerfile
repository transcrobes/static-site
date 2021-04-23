FROM registry.gitlab.com/pages/hugo:latest

RUN apk add python3

RUN pip3 install requests

# WORKDIR /app

# COPY . /app

RUN python3 test.py
