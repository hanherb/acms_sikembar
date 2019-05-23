const express = require('express');
const app = express();
const cookieParser = require('cookie-parser');
const jwt = require('jsonwebtoken');
const fs = require('fs');
const mongodb = require('mongodb');
const mongo = require('./mongo-connect');

const registerPlugin = require('../plugin/register/register');
const loginPlugin = require('../plugin/login/login');

app.use(cookieParser());

exports.redirectIndex = function(req, res) {
	var currentUrl = 'http://' + req.get('host').split(":")[0];
	res.redirect(currentUrl + ':8080/')
}

exports.getUser = function(req, res) {
	res.json(1);
}

exports.getLog = function(req, res) {
	console.log("kuda");
	mongo.mongoLogger("find", {}, function(response) {
		res.json(response);
	});
}

exports.importCsv = function(req, res) {
	res.json(1);
}

exports.registerUser = function(req, res) {
	registerPlugin.register(req, res);
}

exports.loginUser = function(req, res) {
	loginPlugin.login(req, res);
}

exports.updateUser = function(req, res) {
	let query = [{email: req.body.email}, {$set: {
		fullname: req.body.fullname, 
		role: req.body.role, 
		authority: req.body.authority,
		status: req.body.status,
		badan_usaha: req.body.badan_usaha,
	    izin: req.body.izin,
	    generasi: req.body.generasi,
	    tahapan_kegiatan: req.body.tahapan_kegiatan,
	    komoditas: req.body.komoditas,
	    alamat_kantor: req.body.alamat_kantor,
	    telepon: req.body.telepon,
	    fax: req.body.fax,
	    website: req.body.website,
	    npwp: req.body.npwp,
	    lokasi_tambang: req.body.lokasi_tambang,
		profile_picture: req.body.profile_picture,
	}}];
	mongo.mongoUser("update", query, function(response) {
		res.json(response);
	});
}

exports.deleteUser = function(req, res) {
	let query = {email: req.body.email};
	mongo.mongoUser("delete", query, function(response) {
		res.json(response);
	});
}

exports.postPicture = function(req, res) {
	if(req.file) {
		res.json(req.file);
	}
	else {
		res.json('No Profile Picture Uploaded');
	}
}

exports.getRole = function(req, res) {
	res.json(1);
}

exports.listPlugin = function(req, res) {
	let folder = __dirname + '/../plugin/';
	let temp = [];
	fs.readdir(folder, (err, files) => {
		files.forEach(file => {
	 		temp.push(file);
  		});
  		res.json(temp);
	});
}

exports.getPlugin = function(req, res) {
	res.json(1);
}

exports.addPlugin = function(req, res) {
	let plugin = req.body.plugin;
	let newPlugin = '';
	for(let i = 0; i <= plugin.length; i++) {
		if(i < plugin.length) {
			let query = [{name: plugin[i].name}, {$set: {
				name: plugin[i].name, 
				status: plugin[i].status
			}}, {upsert: true}];
			mongo.mongoPlugin("update", query, function(response) {
				if(response.result.upserted) {
					newPlugin = {
						name: plugin[i].name,
						status: plugin[i].status
					};
					console.log(newPlugin);
				}
			});
		}
		else {
			setTimeout(function() {
				console.log(newPlugin);
				if(newPlugin == '')
					res.json(1)
				else 
					res.json(newPlugin);
			}, 2000);
		}
	}
}

exports.logout = function(req, res) {
	res.json(1);
}