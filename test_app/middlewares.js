// various middlewares for the High Tech Pool server

module.exports.authenticateRaiaLogin = function(req, res, next) {
	if (req.session.loggedRaia) {
		next();
	} else {
		res.type('text/html');
	    res.status(401);
	    res.send('401 - Esta raia deve estar logada no sistema para poder acessar esta página<br>Acesse<a href="/"></a>');
	}
}