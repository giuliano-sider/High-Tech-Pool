var express = require('express');
var app = express();
var path = require('path');
var ocupada = false;

var EventEmitter = require('events').EventEmitter;
var emitter = new EventEmitter();

app.get('/welcome', (req, res) => {
    res.sendFile(path.join(__dirname+'/welcome.html'));
});

app.get('/statistics', (req, res) => {
    res.sendFile(path.join(__dirname+'/statistics.html'));
});

app.post('/server', (req, res) => {
    emitter.on('server', function refreshHandler () {
      console.log('evento');
      emitter.removeListener('server', refreshHandler);
      res.send('ok');
    })
});

app.post('/*', function (req, res) {
  console.log(req.url);
  ocupada = !ocupada;
  emitter.emit('server', {});
  res.send('Got a POST request');
});

app.listen(3000, () => {
    console.log('Example app listening on port 3000!');
});
