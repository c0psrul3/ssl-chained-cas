#!/bin/bash

test -z "$1" && exit

cert="$1"

openssl req -newkey rsa:1024 -keyout ${cert}.key -nodes \
  -config openssl.cnf -out ${cert}.req

openssl ca -config openssl.cnf -out ${cert}.crt \
  -infiles ${cert}.req

