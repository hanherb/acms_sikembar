const express = require('express');
const app = express();
const cookieParser = require('cookie-parser');
const jwt = require('jsonwebtoken');
const fs = require('fs');
const node_xj = require("xls-to-json");
const mongodb = require('mongodb');
const mongo = require('./mongo-connect');

const registerPlugin = require('../plugin/register/register');
const loginPlugin = require('../plugin/login/login');
const commercePlugin = require('../plugin/commerce/commerce');

app.use(cookieParser());

exports.redirectIndex = function(req, res) {
	var currentUrl = 'http://' + req.get('host').split(":")[0];
	res.redirect(currentUrl + ':8080/')
}

exports.getUser = function(req, res) {
	res.json(1);
}

exports.getLog = function(req, res) {
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
	let query = [{user_id: req.body.user_id}, {
		username: req.body.username,
		fullname: req.body.fullname,
		password: req.body.password,
		role: req.body.role
	}];
	mongo.mongoUser("update", query, function(response) {
		res.json(response);
	});
}

exports.deleteUser = function(req, res) {
	let query = {user_id: req.body.user_id};
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

exports.postGoodsPicture = function(req, res) {
	if(req.file) {
		res.json(req.file);
	}
	else {
		res.json('No Goods Picture Uploaded');
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

exports.getKomoditas = function(req, res) {
	mongo.mongoKomoditas("find", {}, function(response) {
		res.json(response);
	});
}

exports.addKomoditas = function(req, res) {
	let obj = {
		data: req.body.data,
	};
	mongo.mongoKomoditas("insert", obj, function(response) {
		res.json(response);
	});
}

exports.getAsumsiKeuangan = function(req, res) {
	mongo.mongoAsumsiKeuangan("find", {}, function(response) {
		res.json(response);
	});
}

exports.addAsumsiKeuangan = function(req, res) {
	let obj = {
		data: req.body.data,
		upload_by: req.body.upload_by,
		tahapan_kegiatan: req.body.tahapan_kegiatan
	};
	mongo.mongoAsumsiKeuangan("insert", obj, function(response) {
		res.json(response);
	});
}

exports.addReport = function(req, res) {
	let obj = {
		user_id: req.body.user_id,
    	year: req.body.year,
		report_type: req.body.report_type,
		rate: req.body.rate,
		approved: req.body.approved,
		flagged_for_deletion: req.body.flagged_for_deletion,
		term: req.body.term,
		currency: req.body.currency
	};
	mongo.mongoReport("insert", obj, function(response) {
		res.json(response);
	});
}

exports.getReport = function(req, res) {
	res.json(1);
}

exports.addNeraca = function(req, res) {
	let obj = {
        report_id: req.body.report_id,
        detail: req.body.detail,
        value: req.body.value,
        category: req.body.category,
        sub_category: req.body.sub_category
	};
	mongo.mongoNeraca("insert", obj, function(response) {
		res.json(response);
	});
}

exports.getNeraca = function(req, res) {
	res.json(1);
}

exports.addLabaRugi = function(req, res) {
	let obj = {
		data: req.body.data,
		upload_by: req.body.upload_by,
		tahapan_kegiatan: req.body.tahapan_kegiatan,
		komoditas: req.body.komoditas
	};
	mongo.mongoLabaRugi("insert", obj, function(response) {
		res.json(response);
	});
}

exports.getLabaRugi = function(req, res) {
	mongo.mongoLabaRugi("find", {}, function(response) {
		res.json(response);
	});
}

exports.addHargaPokok = function(req, res) {
	let obj = {
		data: req.body.data,
		upload_by: req.body.upload_by,
		tahapan_kegiatan: req.body.tahapan_kegiatan
	};
	mongo.mongoHargaPokok("insert", obj, function(response) {
		res.json(response);
	});
}

exports.getHargaPokok = function(req, res) {
	mongo.mongoHargaPokok("find", {}, function(response) {
		res.json(response);
	});
}

exports.addArusKas = function(req, res) {
	let obj = {
		data: req.body.data,
		upload_by: req.body.upload_by,
		tahapan_kegiatan: req.body.tahapan_kegiatan
	};
	mongo.mongoArusKas("insert", obj, function(response) {
		res.json(response);
	});
}

exports.getArusKas = function(req, res) {
	mongo.mongoArusKas("find", {}, function(response) {
		res.json(response);
	});
}

exports.addInvestasi = function(req, res) {
	let obj = {
		data: req.body.data,
		upload_by: req.body.upload_by,
		tahapan_kegiatan: req.body.tahapan_kegiatan
	};
	mongo.mongoInvestasi("insert", obj, function(response) {
		res.json(response);
	});
}

exports.getInvestasi = function(req, res) {
	mongo.mongoInvestasi("find", {}, function(response) {
		res.json(response);
	});
}

exports.addPenerimaanNegara = function(req, res) {
	let obj = {
		data: req.body.data,
		upload_by: req.body.upload_by,
		tahapan_kegiatan: req.body.tahapan_kegiatan
	};
	mongo.mongoPenerimaanNegara("insert", obj, function(response) {
		res.json(response);
	});
}

exports.getPenerimaanNegara = function(req, res) {
	mongo.mongoPenerimaanNegara("find", {}, function(response) {
		res.json(response);
	});
}

exports.addKeuanganLainnya = function(req, res) {
	let obj = {
		data: req.body.data,
		upload_by: req.body.upload_by,
		tahapan_kegiatan: req.body.tahapan_kegiatan
	};
	mongo.mongoKeuanganLainnya("insert", obj, function(response) {
		res.json(response);
	});
}

exports.getKeuanganLainnya = function(req, res) {
	mongo.mongoKeuanganLainnya("find", {}, function(response) {
		res.json(response);
	});
}

exports.addSumberPembiayaan = function(req, res) {
	let obj = {
		data: req.body.data,
		upload_by: req.body.upload_by,
		tahapan_kegiatan: req.body.tahapan_kegiatan
	};
	mongo.mongoSumberPembiayaan("insert", obj, function(response) {
		res.json(response);
	});
}

exports.getSumberPembiayaan = function(req, res) {
	mongo.mongoSumberPembiayaan("find", {}, function(response) {
		res.json(response);
	});
}

exports.addAnggaranBelanja = function(req, res) {
	let obj = {
		data: req.body.data,
		upload_by: req.body.upload_by,
		tahapan_kegiatan: req.body.tahapan_kegiatan
	};
	mongo.mongoAnggaranBelanja("insert", obj, function(response) {
		res.json(response);
	});
}

exports.getAnggaranBelanja = function(req, res) {
	mongo.mongoAnggaranBelanja("find", {}, function(response) {
		res.json(response);
	});
}

exports.addBelanjaBarang = function(req, res) {
	let obj = {
		data: req.body.data,
		upload_by: req.body.upload_by
	};
	mongo.mongoBelanjaBarang("insert", obj, function(response) {
		res.json(response);
	});
}

exports.getBelanjaBarang = function(req, res) {
	mongo.mongoBelanjaBarang("find", {}, function(response) {
		res.json(response);
	});
}

exports.getCommerce = function(req, res) {
	res.json(1);
}

exports.addItem = function(req, res) {
	commercePlugin.add(req, res);
}

exports.updateItem = function(req, res) {
	commercePlugin.update(req, res);
}

exports.deleteItem = function(req, res) {
	commercePlugin.delete(req, res);
}

exports.logout = function(req, res) {
	res.json(1);
}