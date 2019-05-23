var mongodb = require('mongodb');
var mongo = require('./mongo-connect');
var {buildSchema} = require('graphql');
var mergeSchema = require('graphql-tools');

var defaultSchema = buildSchema(`
	type Query {
		user(_id: String!): Person,
		users: [Person],
		logs: [Log],
		roles: [Role],
		plugin(name: String!): Plugin,
		plugins: [Plugin],
	},

	type Person {
		_id: String,
	    fullname: String,
	    email: String,
	    role: String,
	    authority: [String],
	    status: String,
	    badan_usaha: String,
	    izin: String,
	    generasi: String,
	    tahapan_kegiatan: String,
	    komoditas: String
	    alamat_kantor: String,
	    telepon: String,
	    fax: String,
	    website: String,
	    npwp: String,
	    lokasi_tambang: String,
	    profile_picture: String
  	},

  	type Log {
  		_id: String,
  		path: String,
  		userId: String,
  		date: String
  	},

  	type Plugin {
  		name: String,
  		status: Int
  	},

  	type Role {
		role_name: String
  	},

  	type Mutation {
		updateUser(email: String!, input: PersonInput): Person,
		createUser(input: PersonInput): Person,
		deleteUser(email: String!): Person,
		createLog(input: LogInput): Log,
		updatePlugin(name: String!, input: PluginInput): Plugin
		createPlugin(input: PluginInput): Plugin
	},

	input PersonInput {
		_id: String,
	    fullname: String,
	    email: String,
	    role: String,
	    authority: [String],
	    password: String,
	    status: String,
	    badan_usaha: String,
	    izin: String,
	    generasi: String,
	    tahapan_kegiatan: String,
	    komoditas: String
	    alamat_kantor: String,
	    telepon: String,
	    fax: String,
	    website: String,
	    npwp: String,
	    lokasi_tambang: String,
	    profile_picture: String
  	},

  	input LogInput {
  		_id: String,
  		path: String,
  		userId: String,
  		date: String
  	}

  	input PluginInput {
  		name: String,
  		status: Int
  	}
`);

var schemas = [];
schemas.push(defaultSchema);

exports.schema = mergeSchema.mergeSchemas({
  schemas: schemas
});

var users = [];
mongo.mongoUser("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		response[i]._id = response[i]._id.toString();
		users.push(response[i]);
	}
});

var logs = [];
mongo.mongoLogger("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		response[i]._id = response[i]._id.toString();
		logs.push(response[i]);
	}
});

var roles = [];
mongo.mongoRole("find", {}, function(response) { 
	for(var i = 0; i < response.length; i++) {
		roles.push(response[i]);
	}
});

var plugins = [];
mongo.mongoPlugin("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		plugins.push(response[i]);
	}
});

var getUser = function(args) {
	var userId = args._id;
  	for(var i = 0; i < users.length; i++) {
	  	if(userId == users[i]._id) {
	  		return users[i];
	  	}
	}
}

var getUsers = function() {
	return users;
}

var getLogs = function() {
	return logs;
}

var getRoles = function() {
	return roles;
}

var getPlugin = function(args) {
	var pluginName = args.name;
  	for(var i = 0; i < plugins.length; i++) {
	  	if(pluginName == plugins[i].name) {
	  		return plugins[i];
	  	}
	}
}

var getPlugins = function() {
	return plugins;
}

var updateUserFunction = function({email, input}) {
	var userEmail = email;
  	for(var i = 0; i < users.length; i++) {
	  	if(userEmail == users[i].email) {
	  		let id = users[i]._id;
	  		let email = users[i].email;
	  		let fullname = users[i].fullname;
	  		let role = users[i].role;
	  		let authority = users[i].authority;
	  		let status = users[i].status;
	  		let badan_usaha = users[i].badan_usaha;
	  		let izin = users[i].izin;
	  		let generasi = users[i].generasi;
	  		let tahapan_kegiatan = users[i].tahapan_kegiatan;
	  		let komoditas = users[i].komoditas;
	  		let alamat_kantor = users[i].alamat_kantor;
	  		let telepon = users[i].telepon;
	  		let fax = users[i].fax;
	  		let website = users[i].website;
	  		let npwp = users[i].npwp;
	  		let lokasi_tambang = users[i].lokasi_tambang;
	  		let profile_picture = users[i].profile_picture;
	  		users[i] = input;
	  		if(users[i]._id == undefined)
	  			users[i]._id = id;
	  		if(users[i].email == undefined)
	  			users[i].email = email;
	  		if(users[i].fullname == undefined)
	  			users[i].fullname = fullname;
	  		if(users[i].role == undefined)
	  			users[i].role = role;
	  		if(users[i].authority == undefined)
	  			users[i].authority = authority;
	  		if(users[i].status == undefined)
	  			users[i].status = status;
	  		if(users[i].badan_usaha == undefined)
	  			users[i].badan_usaha = badan_usaha;
	  		if(users[i].izin == undefined)
	  			users[i].izin = izin;
	  		if(users[i].generasi == undefined)
	  			users[i].generasi = generasi;
	  		if(users[i].tahapan_kegiatan == undefined)
	  			users[i].tahapan_kegiatan = tahapan_kegiatan;
	  		if(users[i].komoditas == undefined)
	  			users[i].komoditas = komoditas;
	  		if(users[i].alamat_kantor == undefined)
	  			users[i].alamat_kantor = alamat_kantor;
	  		if(users[i].telepon == undefined)
	  			users[i].telepon = telepon;
	  		if(users[i].fax == undefined)
	  			users[i].fax = fax;
	  		if(users[i].website == undefined)
	  			users[i].website = website;
	  		if(users[i].npwp == undefined)
	  			users[i].npwp = npwp;
	  		if(users[i].lokasi_tambang == undefined)
	  			users[i].lokasi_tambang = lokasi_tambang;
	  		if(users[i].profile_picture == undefined)
	  			users[i].profile_picture = profile_picture;
	  		return input;
	  	}
	}
}

var createUserFunction = function({input}) {
	users.push(input);
	return input;
}

var deleteUserFunction = function({email}) {
	var userEmail = email;
  	for(var i = 0; i < users.length; i++) {
	  	if(userEmail == users[i].email) {
	  		users.splice(i, 1);
	  		return users[i].email;
	  	}
	}
}

var createLogFunction = function({input}) {
	logs.push(input);
	return input;
}

var createPluginFunction = function({input}) {
	plugins.push(input);
	return input;
}

var updatePluginFunction = function({name, input}) {
	var pluginName = name;
	for(var i = 0; i < plugins.length; i++) {
		if(pluginName == plugins[i].name) {
			plugins[i] = input;
			return input;
		}
	}
}


exports.root = {
	user: getUser,
	users: getUsers,
	logs: getLogs,
	roles: getRoles,
	plugin: getPlugin,
	plugins: getPlugins,

	updateUser: updateUserFunction,
	createUser: createUserFunction,
	deleteUser: deleteUserFunction,
	createLog: createLogFunction,
	createPlugin: createPluginFunction,
	updatePlugin: updatePluginFunction
};