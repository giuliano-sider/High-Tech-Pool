var express = require('express');
var app = express();
var path = require('path');

var mysql = require('mysql');

var serialport = require('serialport');

// vários requests do browser vão pedir informações do BD,
// por exemplo, a lista de treinamento disponíveis
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'pool',
    password: 'password',
    database: 'High_Tech_Pool'
});

//var arduinoSerialPort = '/dev/ttyACM0'; // check which device file it really is
//// listening on the serial port for data coming from Arduino over USB
//var serialPort = new serialport.SerialPort(arduinoSerialPort, {
//    parser: serialport.parsers.readline('\n') // every line is a data event
//});
//
//// when a new line of text is received from Arduino over USB
//serialPort.on('data', function (data) {
//    console.log('got data:\n' + data);
//});

// usado para emitir os eventos de 'toggle cartão'
var EventEmitter = require('events').EventEmitter;
var emitter = new EventEmitter();


// estado da(s) High Tech Pool(s):

// a raia está ocupada? inicialmente não
var ocupada = false;


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

app.get('/treino_livre', (req, res) => {
    res.sendFile(path.join(__dirname+'/treino-livre.html'));
});

app.get('/escolha_treino', (req, res) => {
    res.sendFile(path.join(__dirname+'/escolha-treino.html'));
});

app.get('/treinamentoA', (req, res) => {
    res.sendFile(path.join(__dirname+'/treinamentoA.html'));
});

app.get('/treinamentoB', (req, res) => {
    res.sendFile(path.join(__dirname+'/treinamentoB.html'));
});

app.get('/treinamentoC', (req, res) => {
    res.sendFile(path.join(__dirname+'/treinamentoC.html'));
});

// páginas waiting e welcome postam aqui
// para esperar o evento de check in e check out de raia
// PROBLEMA: acho que esse request dá timeout depois de um tempo
// SOLUÇÃO: web sockets?
app.post('/esperando_toggle_cartao', (req, res) => {
    emitter.on('toggle_cartao', function refreshHandler () {
      console.log('evento');
      emitter.removeListener('toggle_cartao', refreshHandler);
      res.send('ok');
    });
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
