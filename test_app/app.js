// central server for High Tech Pool
// run nodemon app.js

var express = require('express');
var morgan = require('morgan');
var bodyParser = require("body-parser");
var cookieParser = require('cookie-parser');
var session = require('express-session');
var https = require('https');
var fs = require('fs');

var mysql = require('mysql');

var conn = mysql.createConnection({
    host: "localhost",
    user: "pool",
    password: "password",
    database: "High_Tech_Pool"
});

var mid = require('./middlewares.js');
var pm = require('./pool_management.js');

// generate a cookie secret
var randomstring = require('randomstring');
var cookieSecret = randomstring.generate({
    length: 12,
    charset: 'alphabetic'
});

var app = express();

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
    pm.lock_lane(req.body.id_piscina, req.body.numero_raia);

    // user must be an admin
    // lane state must be 'desocupada'
    


});

// tela de espera duma raia
app.get('/raia_espera',
    mid.authenticateRaiaLogin,
    function(req, res) {
        
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

// command for getting the private key and the (self signed) public certificate for https:
// openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes
var https_options = {
    key: fs.readFileSync(__dirname + '/ssl/key.pem'),
    cert: fs.readFileSync(__dirname + '/ssl/cert.pem')
};
// launch server
https.createServer(https_options, app).listen(port, function() {
    console.log(
        'Starting at: ' + Date() + '\n' +
        'High Tech Pool server running on https://localhost:' + port + '\n' +
        '    press Ctrl-C to terminate.\n'
    );
});