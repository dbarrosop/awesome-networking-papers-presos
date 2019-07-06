FROM node:latest

ADD Makefile .

RUN make install-link-check

ADD . .
