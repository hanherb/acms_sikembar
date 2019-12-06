const mariadb = require("mariadb");
const pool = mariadb.createPool({host: 'localhost', user: 'root', password: '90807060', database: 'sikembar'});

exports.mongoUser = function(action, query, callback) {
	if(action == "find") {
		console.log("Connection Established. Action="+action);
		pool.query("select * from users")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
	else if(action == "insert") {
		console.log("Connection Established. Action="+action);
		pool.query("insert into users values (null, '"+query.username+"', '"+query.password+"', null, '"+query.role+"')")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}

	else if(action == "update") {
		console.log("Connection Established. Action="+action);
		pool.query("update users set username='"+query[1].username+"', password='"+query[1].password+"', role='"+query[1].role+"', role='"+query[1].role+"' where user_id="+query[0].user_id)
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}

	else if(action == "delete") {
		console.log("Connection Established. Action="+action);
		pool.query("delete from users where user_id = "+query.user_id)
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});		
  	}

	else if(action == "find-query") {
		console.log("Connection Established. Action="+action);
		pool.query("select * from users where username='"+query.username+"' and password='"+query.password+"'")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
}

exports.mongoNeraca = function(action, query, callback) {
	if(action == "find") {
		console.log("Connection Established. Action="+action);
		pool.query("select * from balances")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
	else if(action == "insert") {
		console.log("Connection Established. Action="+action);
		pool.query("insert into balances values (null, '"+query.report_id+"', '"+query.detail+"', '"+query.value+"', '"+query.category+"', '"+query.sub_category+"')")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
}

exports.mongoLabaRugi = function(action, query, callback) {
	if(action == "find") {
		console.log("Connection Established. Action="+action);
		pool.query("select * from profit_losses")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
	else if(action == "insert") {
		console.log("Connection Established. Action="+action);
		pool.query("insert into profit_losses values (null, '"+query.report_id+"', '"+query.detail+"', '"+query.value+"', '"+query.category+"')")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
}

exports.mongoPenerimaanNegara = function(action, query, callback) {
	if(action == "find") {
		console.log("Connection Established. Action="+action);
		pool.query("select * from national_incomes")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
	else if(action == "insert") {
		console.log("Connection Established. Action="+action);
		pool.query("insert into national_incomes values (null, '"+query.report_id+"', '"+query.detail+"', '"+query.value+"', '"+query.category+"')")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
}

exports.mongoArusKas = function(action, query, callback) {
	if(action == "find") {
		console.log("Connection Established. Action="+action);
		pool.query("select * from cashflows")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
	else if(action == "insert") {
		console.log("Connection Established. Action="+action);
		pool.query("insert into cashflows values (null, '"+query.report_id+"', '"+query.detail+"', '"+query.value+"', '"+query.category+"')")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
}

exports.mongoAnggaranBelanja = function(action, query, callback) {
	if(action == "find") {
		console.log("Connection Established. Action="+action);
		pool.query("select * from budgets")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
	else if(action == "insert") {
		console.log("Connection Established. Action="+action);
		pool.query("insert into budgets values (null, '"+query.report_id+"', '"+query.detail+"', '"+query.value+"', '"+query.category+"')")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
}

exports.mongoHargaPokok = function(action, query, callback) {
	if(action == "find") {
		console.log("Connection Established. Action="+action);
		pool.query("select * from costofgoods")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
	else if(action == "insert") {
		console.log("Connection Established. Action="+action);
		pool.query("insert into costofgoods values (null, '"+query.report_id+"', '"+query.detail+"', '"+query.value+"')")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
}

exports.mongoSumberPembiayaan = function(action, query, callback) {
	if(action == "find") {
		console.log("Connection Established. Action="+action);
		pool.query("select * from source_of_financings")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
	else if(action == "insert") {
		console.log("Connection Established. Action="+action);
		pool.query("insert into source_of_financings values (null, '"+query.report_id+"', '"+query.detail+"', '"+query.value+"')")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
}

exports.mongoInvestasi = function(action, query, callback) {
	if(action == "find") {
		console.log("Connection Established. Action="+action);
		pool.query("select * from investments")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
	else if(action == "insert") {
		console.log("Connection Established. Action="+action);
		pool.query("insert into investments values (null, '"+query.report_id+"', '"+query.detail+"', '"+query.value+"')")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
}

exports.mongoKeuanganLainnya = function(action, query, callback) {
	if(action == "find") {
		console.log("Connection Established. Action="+action);
		pool.query("select * from other_finances")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
	else if(action == "insert") {
		console.log("Connection Established. Action="+action);
		pool.query("insert into other_finances values (null, '"+query.report_id+"', '"+query.detail+"', '"+query.value+"')")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
}

exports.mongoAsumsiKeuangan = function(action, query, callback) {
	if(action == "find") {
		console.log("Connection Established. Action="+action);
		pool.query("select * from assumptions")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
	else if(action == "insert") {
		console.log("Connection Established. Action="+action);
		pool.query("insert into assumptions values (null, '"+query.report_id+
			"', '"+query.unit_rate+
			"', '"+query.detail+
			"', '"+query.volume_value+
			"', '"+query.price_value+
			"', '"+query.cutoff_grade_value+
			"', '"+query.cutoff_grade_unit+
			"', '"+query.volume_unit+
			"', '"+query.currency+"')")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
}

exports.mongoReport = function(action, query, callback) {
	if(action == "find") {
		console.log("Connection Established. Action="+action);
		pool.query("select * from reports")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
	else if(action == "insert") {
		console.log("Connection Established. Action="+action);
		pool.query("insert into reports values (null, "+query.user_id+
			", '"+query.report_type+
			"', '"+query.rate+
			"', '"+query.approved+
			"', '"+query.flagged_for_deletion+
			"', '"+query.term+
			"', '"+query.currency+
			"', "+query.year+")")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
}

exports.mongoBelanjaBarang = function(action, query, callback) {
	if(action == "find") {
		console.log("Connection Established. Action="+action);
		pool.query("select * from procurements")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
	else if(action == "insert") {
		console.log("Connection Established. Action="+action);
		pool.query("insert into procurements values (null, '"+query.detail+
			"', '"+query.specification+
			"', '"+query.project_area+
			"', "+query.tkdn+
			", "+query.report_procurement_id+
			", '"+query.country_of_origin+
			"', '"+query.province_of_origin+
			"', '"+query.district_of_origin+
			"', '"+query.city_of_origin+
			"', "+query.qty+
			", '"+query.category+
			"', "+query.unit_price+")")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
}

exports.mongoReportBarang = function(action, query, callback) {
	if(action == "find") {
		console.log("Connection Established. Action="+action);
		pool.query("select * from report_procurements")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
	else if(action == "insert") {
		console.log("Connection Established. Action="+action);
		pool.query("insert into report_procurements values (null, "+query.user_id+
			", '"+query.report_type+
			"', "+query.approved+
			", "+query.flagged_for_deletion+
			", '"+query.term+
			"', "+query.year+")")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
}

// exports.mongoRole = function(action, query, callback) {
// 	MongoClient.connect(mongourl, function(err, db) {
// 		if(err) {
// 			console.log("Error: ", err);
// 		}
// 		else {
// 			var dbo = db.db("sikembar");

// 			if(action == "find") {
// 				console.log("Connection Established. Action="+action);
// 				dbo.collection("roles").find({}).toArray(function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}
// 		}
// 	});
// }

// exports.mongoPlugin = function(action, query, callback) {
// 	MongoClient.connect(mongourl, function(err, db) {
// 		if(err) {
// 			console.log("Error: ", err);
// 		}
// 		else {
// 			var dbo = db.db("sikembar");

// 			if(action == "update") {
// 				console.log("Connection Established. Action="+action);
// 				dbo.collection("plugin").update(query[0], query[1], query[2], function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}

// 			else if(action == "find") {
// 				dbo.collection("plugin").find({}).toArray(function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}
// 		}
// 	});
// }

exports.mongoLogger = function(action, query, callback) {
	if(action == "insert") {
		console.log(query);
		console.log("Connection Established. Action="+action);
		pool.query("insert into logs values (null, '"+query.path+
			"', "+query.user_id+
			", '"+query.date+
			"', '"+query.detail+"')")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}

	else if(action == "find") {
		console.log("Connection Established. Action="+action);
		pool.query("select * from logs")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
}

// exports.mongoPermission = function(action, query, callback) {
// 	MongoClient.connect(mongourl, function(err, db) {
// 		if(err) {
// 			console.log("Error: ", err);
// 		}
// 		else {
// 			var dbo = db.db("sikembar");

// 			if(action == "insert") {
// 				console.log("Connection Established. Action="+action);
// 				dbo.collection("permissions").insertOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "insert") {
// 				console.log("Connection Established. Action="+action);
// 				dbo.collection("permissions").find({}).toArray(function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}
// 		}
// 	});
// }

// exports.mongoCompanyType = function(action, query, callback) {
// 	MongoClient.connect(mongourl, function(err, db) {
// 		if(err) {
// 			console.log("Error: ", err);
// 		}
// 		else {
// 			var dbo = db.db("sikembar");

// 			if(action == "insert") {
// 				console.log("Connection Established. Action="+action);
// 				dbo.collection("company_types").insertOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "find") {
// 				dbo.collection("company_types").find({}).toArray(function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}
// 		}
// 	});
// }

// exports.mongoKomoditas = function(action, query, callback) {
// 	MongoClient.connect(mongourl, function(err, db) {
// 		if(err) {
// 			console.log("Error: ", err);
// 		}
// 		else {
// 			var dbo = db.db("sikembar");

// 			if(action == "insert") {
// 				console.log("Connection Established. Action="+action);
// 				dbo.collection("komoditas").insertOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "find") {
// 				dbo.collection("komoditas").find({}).toArray(function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "update") {
// 				dbo.collection("komoditas").update(query[0], query[1], function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}

// 			else if(action == "delete") {
// 				dbo.collection("komoditas").deleteOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}
// 		}
// 	});
// }

// exports.mongoAsumsiKeuangan = function(action, query, callback) {
// 	MongoClient.connect(mongourl, function(err, db) {
// 		if(err) {
// 			console.log("Error: ", err);
// 		}
// 		else {
// 			var dbo = db.db("sikembar");

// 			if(action == "insert") {
// 				console.log("Connection Established. Action="+action);
// 				dbo.collection("asumsiKeuangan").insertOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "find") {
// 				dbo.collection("asumsiKeuangan").find({}).toArray(function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "update") {
// 				dbo.collection("asumsiKeuangan").update(query[0], query[1], function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}

// 			else if(action == "delete") {
// 				dbo.collection("asumsiKeuangan").deleteOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}
// 		}
// 	});
// }

// exports.mongoNeraca = function(action, query, callback) {
// 	MongoClient.connect(mongourl, function(err, db) {
// 		if(err) {
// 			console.log("Error: ", err);
// 		}
// 		else {
// 			var dbo = db.db("sikembar");

// 			if(action == "insert") {
// 				console.log("Connection Established. Action="+action);
// 				dbo.collection("neraca").insertOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "find") {
// 				dbo.collection("neraca").find({}).toArray(function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "update") {
// 				dbo.collection("neraca").update(query[0], query[1], function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}

// 			else if(action == "delete") {
// 				dbo.collection("neraca").deleteOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}
// 		}
// 	});
// }

// exports.mongoLabaRugi = function(action, query, callback) {
// 	MongoClient.connect(mongourl, function(err, db) {
// 		if(err) {
// 			console.log("Error: ", err);
// 		}
// 		else {
// 			var dbo = db.db("sikembar");

// 			if(action == "insert") {
// 				console.log("Connection Established. Action="+action);
// 				dbo.collection("labaRugi").insertOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "find") {
// 				dbo.collection("labaRugi").find({}).toArray(function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "update") {
// 				dbo.collection("labaRugi").update(query[0], query[1], function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}

// 			else if(action == "delete") {
// 				dbo.collection("labaRugi").deleteOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}
// 		}
// 	});
// }

// exports.mongoHargaPokok = function(action, query, callback) {
// 	MongoClient.connect(mongourl, function(err, db) {
// 		if(err) {
// 			console.log("Error: ", err);
// 		}
// 		else {
// 			var dbo = db.db("sikembar");

// 			if(action == "insert") {
// 				console.log("Connection Established. Action="+action);
// 				dbo.collection("hargaPokok").insertOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "find") {
// 				dbo.collection("hargaPokok").find({}).toArray(function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "update") {
// 				dbo.collection("hargaPokok").update(query[0], query[1], function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}

// 			else if(action == "delete") {
// 				dbo.collection("hargaPokok").deleteOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}
// 		}
// 	});
// }

// exports.mongoArusKas = function(action, query, callback) {
// 	MongoClient.connect(mongourl, function(err, db) {
// 		if(err) {
// 			console.log("Error: ", err);
// 		}
// 		else {
// 			var dbo = db.db("sikembar");

// 			if(action == "insert") {
// 				console.log("Connection Established. Action="+action);
// 				dbo.collection("arusKas").insertOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "find") {
// 				dbo.collection("arusKas").find({}).toArray(function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "update") {
// 				dbo.collection("arusKas").update(query[0], query[1], function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}

// 			else if(action == "delete") {
// 				dbo.collection("arusKas").deleteOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}
// 		}
// 	});
// }

// exports.mongoInvestasi = function(action, query, callback) {
// 	MongoClient.connect(mongourl, function(err, db) {
// 		if(err) {
// 			console.log("Error: ", err);
// 		}
// 		else {
// 			var dbo = db.db("sikembar");

// 			if(action == "insert") {
// 				console.log("Connection Established. Action="+action);
// 				dbo.collection("investasi").insertOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "find") {
// 				dbo.collection("investasi").find({}).toArray(function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "update") {
// 				dbo.collection("investasi").update(query[0], query[1], function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}

// 			else if(action == "delete") {
// 				dbo.collection("investasi").deleteOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}
// 		}
// 	});
// }

// exports.mongoPenerimaanNegara = function(action, query, callback) {
// 	MongoClient.connect(mongourl, function(err, db) {
// 		if(err) {
// 			console.log("Error: ", err);
// 		}
// 		else {
// 			var dbo = db.db("sikembar");

// 			if(action == "insert") {
// 				console.log("Connection Established. Action="+action);
// 				dbo.collection("penerimaanNegara").insertOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "find") {
// 				dbo.collection("penerimaanNegara").find({}).toArray(function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "update") {
// 				dbo.collection("penerimaanNegara").update(query[0], query[1], function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}

// 			else if(action == "delete") {
// 				dbo.collection("penerimaanNegara").deleteOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}
// 		}
// 	});
// }

// exports.mongoKeuanganLainnya = function(action, query, callback) {
// 	MongoClient.connect(mongourl, function(err, db) {
// 		if(err) {
// 			console.log("Error: ", err);
// 		}
// 		else {
// 			var dbo = db.db("sikembar");

// 			if(action == "insert") {
// 				console.log("Connection Established. Action="+action);
// 				dbo.collection("keuanganLainnya").insertOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "find") {
// 				dbo.collection("keuanganLainnya").find({}).toArray(function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "update") {
// 				dbo.collection("keuanganLainnya").update(query[0], query[1], function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}

// 			else if(action == "delete") {
// 				dbo.collection("keuanganLainnya").deleteOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}
// 		}
// 	});
// }

// exports.mongoSumberPembiayaan = function(action, query, callback) {
// 	MongoClient.connect(mongourl, function(err, db) {
// 		if(err) {
// 			console.log("Error: ", err);
// 		}
// 		else {
// 			var dbo = db.db("sikembar");

// 			if(action == "insert") {
// 				console.log("Connection Established. Action="+action);
// 				dbo.collection("sumberPembiayaan").insertOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "find") {
// 				dbo.collection("sumberPembiayaan").find({}).toArray(function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "update") {
// 				dbo.collection("sumberPembiayaan").update(query[0], query[1], function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}

// 			else if(action == "delete") {
// 				dbo.collection("sumberPembiayaan").deleteOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}
// 		}
// 	});
// }

// exports.mongoAnggaranBelanja = function(action, query, callback) {
// 	MongoClient.connect(mongourl, function(err, db) {
// 		if(err) {
// 			console.log("Error: ", err);
// 		}
// 		else {
// 			var dbo = db.db("sikembar");

// 			if(action == "insert") {
// 				console.log("Connection Established. Action="+action);
// 				dbo.collection("anggaranBelanja").insertOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "find") {
// 				dbo.collection("anggaranBelanja").find({}).toArray(function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "update") {
// 				dbo.collection("anggaranBelanja").update(query[0], query[1], function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}

// 			else if(action == "delete") {
// 				dbo.collection("anggaranBelanja").deleteOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}
// 		}
// 	});
// }

// exports.mongoBelanjaBarang = function(action, query, callback) {
// 	MongoClient.connect(mongourl, function(err, db) {
// 		if(err) {
// 			console.log("Error: ", err);
// 		}
// 		else {
// 			var dbo = db.db("sikembar");

// 			if(action == "insert") {
// 				console.log("Connection Established. Action="+action);
// 				dbo.collection("belanjaBarang").insertOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "find") {
// 				dbo.collection("belanjaBarang").find({}).toArray(function(err, result) {
// 					if(callback)
// 						return callback(result);
// 			    	db.close();
// 			  	});
// 			}

// 			else if(action == "update") {
// 				dbo.collection("belanjaBarang").update(query[0], query[1], function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}

// 			else if(action == "delete") {
// 				dbo.collection("belanjaBarang").deleteOne(query, function(err, result) {
// 					if(callback)
// 						return callback(result);
// 					db.close();
// 				});
// 			}
// 		}
// 	});
// }

exports.mongoCommerce = function(action, query, callback) {
	if(action == "find") {
		console.log("Connection Established. Action="+action);
		pool.query("select * from commerces")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
	else if(action == "insert") {
		console.log("Connection Established. Action="+action);
		pool.query("insert into commerces values (null, '"+query.name+
			"', "+query.price+
			", "+query.tkdn+
			", "+query.qty+
			", '"+query.description+
			"', '"+query.category+
			"', "+query.user_id+
			", '"+query.image+"')")
		.then(results => {
		    if(callback)
				return callback(results);
		    console.log(results);
		})
		.catch(err => {
		  	console.log(err)
		    //handle error
		});
	}
}