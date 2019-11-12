const mongodb = require('mongodb');
const mongo = require('../../src/mongo-connect');

exports.register = function(req, res) {
	let obj = {
		username: req.body.username,
		fullname: req.body.fullname,
		password: req.body.password,
		role: req.body.role
	};
	mongo.mongoUser("insert", obj, function(response) {
		res.json(response);
	});
}