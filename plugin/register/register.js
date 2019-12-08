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

exports.createUserDetail = function(req, res) {
	let obj = {
		user_id: req.body.user_id,
		company_id: req.body.company_id,
		company_name: req.body.company_name,
		type: req.body.type,
		company_address: req.body.company_address,
		npwp: req.body.npwp,
		email: req.body.email,
		wiup: req.body.wiup,
		license_type: req.body.license_type,
		license_status: req.body.license_status,
		province_code: req.body.province_code,
		province: req.body.province,
		commodity: req.body.commodity
	};
	mongo.mongoUserDetail("insert", obj, function(response) {
		res.json(response);
	});
}