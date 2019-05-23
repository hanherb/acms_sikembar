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