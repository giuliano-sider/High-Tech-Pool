// central server for High Tech Pool
// run nodemon app.js

var express = require('express');
var morgan = require('morgan');
var bodyParser = require("body-parser");
var cookieParser = require('cookie-parser');
var session = require('express-session');
var https = require('https');
var fs = require('fs');
var socket_io = require('socket.io');

var serialport = require('serialport');


// utilizamos uma única conexão mysql. good enough for our purposes
var mysql = require('mysql');
var mysql_conn = mysql.createConnection({
    host: "localhost",
    user: "pool",
    password: "password",
    database: "High_Tech_Pool"
});

var mid = require('./middlewares.js');
var pm = require('./pool_management.js');
var queries = require('./queries.js');

//var arduinoSerialPort = '/dev/ttyACM0'; // check which device file it really is
// listening on the serial port for data coming from Arduino over USB
//var serialPort = new serialport.SerialPort(arduinoSerialPort, {
//    parser: serialport.parsers.readline('\n') // every line is a data event
//});

// when a new line of text is received from Arduino over USB
//serialPort.on('data', function (data) {
//    console.log('got data:\n' + data);
//});

// generate a cookie secret
var randomstring = require('randomstring');
var cookieSecret = randomstring.generate({
    length: 12,
    charset: 'alphabetic'
});

var app = express();

// command for getting the private key and the (self signed) public certificate for https:
// openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes
var https_options = {
    key: fs.readFileSync(__dirname + '/ssl/key.pem'),
    cert: fs.readFileSync(__dirname + '/ssl/cert.pem')
};

// create server and socket io
var server = https.createServer(https_options, app);
var io = socket_io(server);

io.on('connection', function(socket){
    console.log('a user connected\nSocket:\n' + socket);// JSON.stringify(socket, null, 4));
    socket.on('get session info', function(msg) {
        var session_info = JSON.parse(msg);
        io.emit('receive session info', '{"hello":"hi"}') // need to provide session informaation...
    });
});


// use port 3000 by default, but you can set a PORT environment variable
var port = process.env.PORT || 3000;

// log every request in the format:
// :method :url :status :response-time ms - :res[content-length]
app.use(morgan('dev'));

// maintain user sessions
app.use(session({
    secret: cookieSecret,
    resave: false, // ??
    saveUninitialized: false, // ??
    cookie: {
        httpOnly: true,
        secure: true
    }
}));

// debug log:
app.use(function(req, res, next) {
    console.log('\n\n\ncontent of req.session:\n' + JSON.stringify(req.session, null, 4));
    next();
});

// public pages:
app.use(express.static(__dirname + '/public'));

// admin login for a swim lane screen
app.get('/', function(req, res) {
    res.sendFile(__dirname + '/public/pagina_login_raia.html');
});


// admin lane login form is submitted here. 
// read form items into req.body.*
app.post('/login_raia', 
    bodyParser.urlencoded({extended: true})
);
app.post('/login_raia', function(req, res) {
 
    // test if user already logged in:
    if (req.session.loggedRaia) {
        res.redirect('/raia_espera');
    }

    // a raia na piscina está liberada?
    if (!pm.is_lane_free(req.body.id_piscina, req.body.numero_raia)) {
        res.status(401);
        res.send('401 - Não é possível se logar a esta raia no momento');
    }

    // lock the requested piscina/raia while we verify the login details
    // is there a better way to do this with DB transactions?
    pm.set_lane_status(req.body.id_piscina, req.body.numero_raia, 'travada');

    // user must be an admin
    mysql_conn.connect((err) => {
        if (err) {
            pm.free_lane(req.body.id_piscina, req.body.numero_raia);
            throw err;
        }
        mysql_conn.query(
            queries['dados_admin_login_attempt'](req.body.username, req.body.password),
            (err, results) => {
                if (err) {
                    pm.free_lane(req.body.id_piscina, req.body.numero_raia);
                    throw err;  
                } 
                if (!results[0]) { // invalid login attempt
                    pm.free_lane(req.body.id_piscina, req.body.numero_raia);
                    res.status(401);
                    res.send('401 - Login inválido. Você é adminstrador?');
                }

                // login approved!
                req.session.loggedRaia = true;
                req.session.admin_user = results[0]; // all the admin user data
                req.session.id_piscina = req.body.id_piscina;
                req.session.numero_raia = req.body.numero_raia;
                pm.set_lane_status(req.session.id_piscina, req.session.numero_raia, 'tela bemvindo');
                
                res.redirect('/raia_espera');

                /* too much work (and unnecessary) to maintain lane state on the database
                // lane state must be 'desocupada'
                mysql_conn.query(
                    queries['estado_raia'](req.body.id_piscina, req.body.numero_raia),
                    (err, results) => {
                        if (err) {
                            pm.free_lane(req.body.id_piscina, req.body.numero_raia);
                            throw err;  
                        }
                        if (!results[0]['estado'] !== 'desocupada') {
                            pm.free_lane(req.body.id_piscina, req.body.numero_raia);
                            res.status(401);
                            res.send('401 - Login inválido. A raia tem estado ' + results[0]['estado']);
                        }

                    }
                );
                */
            }
        );
    });
    

});

// page wants to know (via XHR) its user session key for socket.io communications
app.get('/io_session_key', (req, res) => {
    if (!req.session.loggedRaia) {
        res.json({error: 'not logged in'});
    } else {
        res.json({
            username: req.session.admin_user['username'],
            numero_raia: req.session.numero_raia,
            id_piscina: req.session.id_piscina
        });
    }
});

// tela de espera duma raia
app.get('/raia_espera',
    mid.authenticateRaiaLogin,
    function(req, res) {
        res.sendFile(__dirname + '/private/waiting.html')
    }
);

// in case there is no page to be served
app.use(function(req, res) {
    res.type('text/plain');
    res.status(404);
    res.send('404 - O recurso que você pediu não se encontra neste servidor. Consulte seu administrador do High Tech Pool');
});

// in case there's an error in the process of serving a page
app.use(function(err, req, res, next) {
    console.error(err.stack);
    res.type('text/plain');
    res.status(500);
    res.send('500 - Erro interno do servidor. Consulte seu adminstrador do High Tech Pool');
});

server.listen(port, function() {
    console.log(
        'Starting at: ' + Date() + '\n' +
        'High Tech Pool server running on https://localhost:' + port + '\n' +
        '    press Ctrl-C to terminate.\n'
    );
});
