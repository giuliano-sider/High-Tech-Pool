var express = require('express');
var app = express();
var path = require('path');

// a raia está ocupada? inicialmente não
var ocupada = false; 

var EventEmitter = require('events').EventEmitter;
var emitter = new EventEmitter();

// vai servir estaticamente tudo nessa pasta ...
app.use(express.static(__dirname + '/'));

// página de espera da raia
app.get('/waiting', (req, res) => { 
    res.sendFile(path.join(__dirname+'/waiting.html'));
});

// página de bem vindo ao usuario (que acabou de fazer check in na raia)
app.get('/welcome', (req, res) => {
    res.sendFile(path.join(__dirname+'/welcome.html'));
});

// páginas waiting e welcome postam aqui 
// para esperar o evento de check in e check out de raia
// PROBLEMA: acho que esse request dá timeout depois de um tempo
// SOLUÇÃO: web sockets?
app.post('/esperando_toggle_cartao', (req, res) => {
    emitter.on('toggle_cartao', function refreshHandler () {
      console.log('evento');
      emitter.removeListener('server', refreshHandler);
      res.send('ok');
    })
});

// retorna uma lista (JSON) de treinamentos disponiveis do BD High Tech Pool
app.get('./treinamentos_disponiveis', (req, res) => {

});

// módulo de sensor de cartão posta aqui para avisar que o status da raia mudou
// (o usuário colocou ou retirou cartão)
app.post('/toggle_cartao', function (req, res) {
    console.log(req.url);
    ocupada = !ocupada;
    emitter.emit('toggle_cartao', {});
    res.send('Got a POST request');
});

app.listen(3000, () => {
    console.log('Example app listening on port 3000!');
});
