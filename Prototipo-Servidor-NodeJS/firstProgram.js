var express = require('express');
var app = express();
var path = require('path');

var mysql = require('mysql');

// vários requests do browser vão pedir informações do BD,
// por exemplo, a lista de treinamento disponíveis
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'pool',
    password: 'password',
    database: 'High_Tech_Pool'
});

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

/*
// list of  all the sql queries we need
/*queries = [
    cabecalho_tipo_treinamento:
        () => 'select * from Tipo_Treinamento;',

    sequencia_exercicios_em_tipo_treinamento:
        (id_tipo_treinamento) => 'select te.*' +
                                 'from Tipo_Exercicio as te' +
                                 '     join Sequencia_Treinamento as st' +
                                 '          on te.id = st.id_tipo_exercicio' +
                                 '     join Tipo_Treinamento as tt' +
                                 '          on tt.id = st.id_tipo_treinamento' +
                                 'where tt.id = ' + id_tipo_treinamento + ' ' +
                                 'order by st.numero_de_sequencia;',


];

// retorna uma lista (JSON) de treinamentos disponiveis do BD High Tech Pool
app.get('./treinamentos_disponiveis', (req, res) => {
// PYRAMID OF DOOM. FIX??
    connection.connect(function(err) {
        if (err) throw err;
        connection.query(
            queries['cabecalho_tipo_treinamento'](),
            (err, treinamentos) => {
                if (err) throw err;
                for (var i = 0; i < treinamentos.length; i++) {
                    treinamentos[i].exercicios = [];
                    connection.query(
                        queries['sequencia_exercicios_em_tipo_treinamento'](treinamento.id),
                        (err, exercicios) => {
                            if (err) throw err;
                            treinamentos[i].exercicios = exercicios;
                        }
                    );
                }
                // tem que retornar o json dessa estrutura agora
            }
        );
    });
});
*/

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
