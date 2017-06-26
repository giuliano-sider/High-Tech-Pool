# notes

- generate the server's private key and the (self-signed) public certificate 
  so that we can use https. 
  add it to the browser's list of certificates when prompted...

```bash
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes
```


