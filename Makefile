#!/usr/bin/make -f
SHELL=/bin/bash

TAG=pdftk

all:	build

build:
	docker build -t ${TAG} .
