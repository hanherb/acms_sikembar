const jwt = require('jsonwebtoken');
const mongodb = require('mongodb');
const mongo = require('../../src/mongo-connect');

exports.login = function(req, res) {
	let query = {username: req.body.username, password: req.body.password};
	mongo.mongoUser("find-query", query, function(response) {
		if(response[0]) {
			jwt.sign({
				id: response[0].user_id,
				username: response[0].username
			},
	    	'kuda', {expiresIn: '24h'}, (err, token) => {
	    		res.json({token, response: response[0]});
	      	});
		}
		else {
			res.json("Login error");
		}
	});
}