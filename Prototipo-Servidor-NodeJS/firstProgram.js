var express = require('express');
var app = express();
var path = require('path');

// makes http requests programatically
var axios = require('axios');

// logging
var morgan = require('morgan');

// did not make into the final product!
var mysql = require('mysql');

// communication with the arduino via serial port
//var serialport = require('serialport');

// vários requests do browser vão pedir informações do BD,
// por exemplo, a lista de treinamento disponíveis
//var connection = mysql.createConnection({
//    host: 'localhost',
//    user: 'pool',
//    password: 'password',
//    database: 'High_Tech_Pool'
//});

// check which device file it really is by comparing /dev/tty* before and after plugging in the serial cable
// var arduinoSerialPort = '/dev/ttyACM0';
//
// // listening on the serial port for data coming from Arduino over USB
// var serialPort = new serialport(arduinoSerialPort, {
//     parser: serialport.parsers.readline('\n') // every line is a data event
// });
//
// // when a new line of text is received from Arduino over USB
// serialPort.on('data', function (data) {
// 	data = JSON.parse(data);
// 	//data = "{ \"sensor\":\"knock1\", \"value\": true }"; // test data
//
// 	if (data.sensor !== 'rfid' ) {
// 		// batida de sensor
// 		emit_batida();
// 	} else if (data.sensor === 'rfid') {
// 		// cartao colocado ou retirado
// 		emit_toggle();
// 	}
//
// 	console.log('raspberry pi got data from serial port:\n', data);
// });

// usado para emitir os eventos de 'toggle cartão'
var EventEmitter = require('events').EventEmitter;
var emitter = new EventEmitter();


// estado da(s) High Tech Pool(s):

// a raia está ocupada? inicialmente não
var ocupada = false;


// log every request in the format:
// :method :url :status :response-time ms - :res[content-length]
app.use(morgan('dev'));

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
      console.log('evento de cartão');
      emitter.removeListener('toggle_cartao', refreshHandler);
      res.send('ok ');
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


// páginas do treinamento postam aqui
// para esperar o evento de batida de sensores da raia
// PROBLEMA: acho que esse request dá timeout depois de um tempo
// SOLUÇÃO: web sockets?
app.post('/esperando_batida_sensor', (req, res) => {
	console.log('oi, eu acabei de receber um /esperando_batida_snesor');
    emitter.on('batida_sensor', function refreshHandler () {
      console.log('evento de batida');
      emitter.removeListener('batida_sensor', refreshHandler);
      res.send('ok');
    });
});

// módulo de sensor de batida posta aqui para informar que o nadador bateu na borda
app.post('/batida_sensor', function (req, res) {
    console.log(req.url);
    emitter.emit('batida_sensor', {});
    res.send('Got a POST request');
});

app.listen(3000, () => {
    console.log('Example app listening on port 3000!');
});

// ação a ser tomada quando houve uma mudança no estado do cartão
var emit_toggle = (data = {}) => {
	axios({
        method: 'post',
        url: 'http://localhost:3000/toggle_cartao',
    		data
    })
	.then((response) => { /*console.log(response);*/ })
	.catch((err) => {
     console.log("Promise Rejected", err);
	});
};

// ação a ser tomada quando houve uma batida de sensor
var emit_batida = (data = {}) => {
	axios({
        method: 'post',
        url: 'http://localhost:3000/batida_sensor',
    		data
    })
	.then((response) => { /*console.log(response);*/ })
	.catch((err) => {
     console.log("Promise Rejected", err);
	});
};
