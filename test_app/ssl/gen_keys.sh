#!/bin/bash
# generates a private key and self signed public certificate
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes