var mongodb = require('mongodb');
var MongoClient = mongodb.MongoClient;
var mongourl = 'mongodb://localhost:27017/';

exports.mongoUser = function(action, query, callback) {
	MongoClient.connect(mongourl, function(err, db) {
		if(err) {
			console.log("Error: ", err);
		}
		else {
			var dbo = db.db("sikembar");

			if(action == "find") {
				console.log("Connection Established. Action="+action);
				dbo.collection("user").find({}).toArray(function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "insert") {
				console.log("Connection Established. Action="+action);
				dbo.collection("user").insert(query, function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "update") {
				console.log("Connection Established. Action="+action);
				dbo.collection("user").update(query[0], query[1], function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}

			else if(action == "delete") {
				console.log("Connection Established. Action="+action);
				dbo.collection("user").deleteOne(query, function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});			
		  	}

			else if(action == "find-query") {
				console.log("Connection Established. Action="+action);
				dbo.collection("user").find(query).toArray(function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}
			else if(action == "session") {
				console.log("Connection Established. Action="+action);
				dbo.collection("user").find(query).toArray(function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}
		}
	});
}

exports.mongoRole = function(action, query, callback) {
	MongoClient.connect(mongourl, function(err, db) {
		if(err) {
			console.log("Error: ", err);
		}
		else {
			var dbo = db.db("sikembar");

			if(action == "find") {
				console.log("Connection Established. Action="+action);
				dbo.collection("role").find({}).toArray(function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}
		}
	});
}

exports.mongoPlugin = function(action, query, callback) {
	MongoClient.connect(mongourl, function(err, db) {
		if(err) {
			console.log("Error: ", err);
		}
		else {
			var dbo = db.db("sikembar");

			if(action == "update") {
				console.log("Connection Established. Action="+action);
				dbo.collection("plugin").update(query[0], query[1], query[2], function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}

			else if(action == "find") {
				dbo.collection("plugin").find({}).toArray(function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}
		}
	});
}

exports.mongoLogger = function(action, query, callback) {
	MongoClient.connect(mongourl, function(err, db) {
		if(err) {
			console.log("Error: ", err);
		}
		else {
			var dbo = db.db("sikembar");

			if(action == "insert") {
				console.log("Connection Established. Action="+action);
				dbo.collection("logger").insertOne(query, function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "find") {
				dbo.collection("logger").find({}).toArray(function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "update") {
				dbo.collection("logger").update(query[0], query[1], function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}

			else if(action == "delete") {
				dbo.collection("logger").deleteOne(query, function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}
		}
	});
}

exports.mongoKomoditas = function(action, query, callback) {
	MongoClient.connect(mongourl, function(err, db) {
		if(err) {
			console.log("Error: ", err);
		}
		else {
			var dbo = db.db("sikembar");

			if(action == "insert") {
				console.log("Connection Established. Action="+action);
				dbo.collection("komoditas").insertOne(query, function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "find") {
				dbo.collection("komoditas").find({}).toArray(function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "update") {
				dbo.collection("komoditas").update(query[0], query[1], function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}

			else if(action == "delete") {
				dbo.collection("komoditas").deleteOne(query, function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}
		}
	});
}

exports.mongoAsumsiKeuangan = function(action, query, callback) {
	MongoClient.connect(mongourl, function(err, db) {
		if(err) {
			console.log("Error: ", err);
		}
		else {
			var dbo = db.db("sikembar");

			if(action == "insert") {
				console.log("Connection Established. Action="+action);
				dbo.collection("asumsiKeuangan").insertOne(query, function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "find") {
				dbo.collection("asumsiKeuangan").find({}).toArray(function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "update") {
				dbo.collection("asumsiKeuangan").update(query[0], query[1], function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}

			else if(action == "delete") {
				dbo.collection("asumsiKeuangan").deleteOne(query, function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}
		}
	});
}

exports.mongoNeraca = function(action, query, callback) {
	MongoClient.connect(mongourl, function(err, db) {
		if(err) {
			console.log("Error: ", err);
		}
		else {
			var dbo = db.db("sikembar");

			if(action == "insert") {
				console.log("Connection Established. Action="+action);
				dbo.collection("neraca").insertOne(query, function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "find") {
				dbo.collection("neraca").find({}).toArray(function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "update") {
				dbo.collection("neraca").update(query[0], query[1], function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}

			else if(action == "delete") {
				dbo.collection("neraca").deleteOne(query, function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}
		}
	});
}

exports.mongoLabaRugi = function(action, query, callback) {
	MongoClient.connect(mongourl, function(err, db) {
		if(err) {
			console.log("Error: ", err);
		}
		else {
			var dbo = db.db("sikembar");

			if(action == "insert") {
				console.log("Connection Established. Action="+action);
				dbo.collection("labaRugi").insertOne(query, function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "find") {
				dbo.collection("labaRugi").find({}).toArray(function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "update") {
				dbo.collection("labaRugi").update(query[0], query[1], function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}

			else if(action == "delete") {
				dbo.collection("labaRugi").deleteOne(query, function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}
		}
	});
}

exports.mongoHargaPokok = function(action, query, callback) {
	MongoClient.connect(mongourl, function(err, db) {
		if(err) {
			console.log("Error: ", err);
		}
		else {
			var dbo = db.db("sikembar");

			if(action == "insert") {
				console.log("Connection Established. Action="+action);
				dbo.collection("hargaPokok").insertOne(query, function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "find") {
				dbo.collection("hargaPokok").find({}).toArray(function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "update") {
				dbo.collection("hargaPokok").update(query[0], query[1], function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}

			else if(action == "delete") {
				dbo.collection("hargaPokok").deleteOne(query, function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}
		}
	});
}

exports.mongoArusKas = function(action, query, callback) {
	MongoClient.connect(mongourl, function(err, db) {
		if(err) {
			console.log("Error: ", err);
		}
		else {
			var dbo = db.db("sikembar");

			if(action == "insert") {
				console.log("Connection Established. Action="+action);
				dbo.collection("arusKas").insertOne(query, function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "find") {
				dbo.collection("arusKas").find({}).toArray(function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "update") {
				dbo.collection("arusKas").update(query[0], query[1], function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}

			else if(action == "delete") {
				dbo.collection("arusKas").deleteOne(query, function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}
		}
	});
}

exports.mongoInvestasi = function(action, query, callback) {
	MongoClient.connect(mongourl, function(err, db) {
		if(err) {
			console.log("Error: ", err);
		}
		else {
			var dbo = db.db("sikembar");

			if(action == "insert") {
				console.log("Connection Established. Action="+action);
				dbo.collection("investasi").insertOne(query, function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "find") {
				dbo.collection("investasi").find({}).toArray(function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "update") {
				dbo.collection("investasi").update(query[0], query[1], function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}

			else if(action == "delete") {
				dbo.collection("investasi").deleteOne(query, function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}
		}
	});
}

exports.mongoPenerimaanNegara = function(action, query, callback) {
	MongoClient.connect(mongourl, function(err, db) {
		if(err) {
			console.log("Error: ", err);
		}
		else {
			var dbo = db.db("sikembar");

			if(action == "insert") {
				console.log("Connection Established. Action="+action);
				dbo.collection("penerimaanNegara").insertOne(query, function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "find") {
				dbo.collection("penerimaanNegara").find({}).toArray(function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "update") {
				dbo.collection("penerimaanNegara").update(query[0], query[1], function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}

			else if(action == "delete") {
				dbo.collection("penerimaanNegara").deleteOne(query, function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}
		}
	});
}

exports.mongoKeuanganLainnya = function(action, query, callback) {
	MongoClient.connect(mongourl, function(err, db) {
		if(err) {
			console.log("Error: ", err);
		}
		else {
			var dbo = db.db("sikembar");

			if(action == "insert") {
				console.log("Connection Established. Action="+action);
				dbo.collection("keuanganLainnya").insertOne(query, function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "find") {
				dbo.collection("keuanganLainnya").find({}).toArray(function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "update") {
				dbo.collection("keuanganLainnya").update(query[0], query[1], function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}

			else if(action == "delete") {
				dbo.collection("keuanganLainnya").deleteOne(query, function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}
		}
	});
}

exports.mongoSumberPembiayaan = function(action, query, callback) {
	MongoClient.connect(mongourl, function(err, db) {
		if(err) {
			console.log("Error: ", err);
		}
		else {
			var dbo = db.db("sikembar");

			if(action == "insert") {
				console.log("Connection Established. Action="+action);
				dbo.collection("sumberPembiayaan").insertOne(query, function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "find") {
				dbo.collection("sumberPembiayaan").find({}).toArray(function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "update") {
				dbo.collection("sumberPembiayaan").update(query[0], query[1], function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}

			else if(action == "delete") {
				dbo.collection("sumberPembiayaan").deleteOne(query, function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}
		}
	});
}

exports.mongoAnggaranBelanja = function(action, query, callback) {
	MongoClient.connect(mongourl, function(err, db) {
		if(err) {
			console.log("Error: ", err);
		}
		else {
			var dbo = db.db("sikembar");

			if(action == "insert") {
				console.log("Connection Established. Action="+action);
				dbo.collection("anggaranBelanja").insertOne(query, function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "find") {
				dbo.collection("anggaranBelanja").find({}).toArray(function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "update") {
				dbo.collection("anggaranBelanja").update(query[0], query[1], function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}

			else if(action == "delete") {
				dbo.collection("anggaranBelanja").deleteOne(query, function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}
		}
	});
}

exports.mongoBelanjaBarang = function(action, query, callback) {
	MongoClient.connect(mongourl, function(err, db) {
		if(err) {
			console.log("Error: ", err);
		}
		else {
			var dbo = db.db("sikembar");

			if(action == "insert") {
				console.log("Connection Established. Action="+action);
				dbo.collection("belanjaBarang").insertOne(query, function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "find") {
				dbo.collection("belanjaBarang").find({}).toArray(function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "update") {
				dbo.collection("belanjaBarang").update(query[0], query[1], function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}

			else if(action == "delete") {
				dbo.collection("belanjaBarang").deleteOne(query, function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}
		}
	});
}

exports.mongoCommerce = function(action, query, callback) {
	MongoClient.connect(mongourl, function(err, db) {
		if(err) {
			console.log("Error: ", err);
		}
		else {
			var dbo = db.db("sikembar");

			if(action == "insert") {
				console.log("Connection Established. Action="+action);
				dbo.collection("commerce").insert(query, function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "find") {
				dbo.collection("commerce").find({}).toArray(function(err, result) {
					if(callback)
						return callback(result);
			    	db.close();
			  	});
			}

			else if(action == "update") {
				dbo.collection("commerce").update(query[0], query[1], function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}

			else if(action == "delete") {
				dbo.collection("commerce").deleteOne(query, function(err, result) {
					if(callback)
						return callback(result);
					db.close();
				});
			}
		}
	});
}