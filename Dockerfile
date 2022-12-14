FROM python:3.11-rc-alpine3.16

LABEL "com.github.actions.name"="GitHub Action for pylint"
LABEL "com.github.actions.description"="Run pylint commands"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="green"

WORKDIR /build
COPY .pylintrc /build/.pylintrc

RUN apk update
RUN apk add expat=2.4.9-r0
RUN apk add py3-pip && apk add git
RUN apk upgrade --available && sync
RUN pip3 install -U setuptools
RUN pip3 install -U pylint
RUN pip3 install -U pylint-exit

RUN pylint --version

ENTRYPOINT [ "/bin/sh" ]
