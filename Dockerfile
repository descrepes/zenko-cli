FROM python:3-alpine3.9

LABEL maintainer="descrepes <alexandre@insideboard.com>"

RUN ["addgroup", "-S", "myuser"]
RUN ["adduser", "-S", "-D", "-h", "/home/myuser", "-G", "myuser", "myuser"]

COPY --chown=myuser:myuser requirements.txt /home/myuser/
COPY --chown=myuser:myuser zenkocli /home/myuser/

RUN apk add jq groff
RUN pip install -U --quiet -r /home/myuser/requirements.txt

USER myuser
WORKDIR /home/myuser

