var mongodb = require('mongodb');
var mongo = require('../../src/mongo-connect');
var {buildSchema} = require('graphql');

exports.schema = buildSchema(`
	type Query {
		commerce(_id: String!): Commerce,
		commerces: [Commerce]
	},

	type Commerce {
		_id: String,
  		name: String,
  		price: Int,
  		tkdn: Int,
  		qty: Int,
  		description: String,
  		category: String,
  		user: String,
  		user_id: String,
  		image: String
  	},

  	type Mutation {
		updateCommerce(_id: String!, input: CommerceInput): Commerce,
		createCommerce(input: CommerceInput): Commerce,
		deleteCommerce(_id: String!): Commerce
	},

	input CommerceInput {
		_id: String,
  		name: String,
  		price: Int,
  		tkdn: Int,
  		qty: Int,
  		description: String,
  		category: String,
  		user: String,
  		user_id: String,
  		image: String
  	}
`);

var commerces = [];
mongo.mongoCommerce("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		response[i]._id = response[i]._id.toString();
		commerces.push(response[i]);
	}
});

var getCommerce = function(args) {
	var itemId = args._id;
  	for(var i = 0; i < commerces.length; i++) {
	  	if(itemId == commerces[i]._id) {
	  		return commerces[i];
	  	}
	}
}

var getCommerces = function() {
	return commerces;
}

var updateCommerceFunction = function({_id, input}) {
	var itemId = _id;
  	for(var i = 0; i < commerces.length; i++) {
	  	if(itemId == commerces[i]._id) {
	  		let id = commerces[i]._id;
	  		let name = commerces[i].name;
	  		let price = commerces[i].price;
	  		let tkdn = commerces[i].tkdn;
	  		let qty = commerces[i].qty;
	  		let description = commerces[i].description;
	  		let category = commerces[i].category;
	  		let user = commerces[i].user;
	  		let user_id = commerces[i].user_id;
	  		let image = commerces[i].image;
	  		commerces[i] = input;
	  		if(commerces[i]._id == undefined)
	  			commerces[i]._id = id;
	  		if(commerces[i].name == undefined)
	  			commerces[i].name = name;
	  		if(commerces[i].price == undefined)
	  			commerces[i].price = price;
	  		if(commerces[i].tkdn == undefined)
	  			commerces[i].tkdn = tkdn;
	  		if(commerces[i].qty == undefined)
	  			commerces[i].qty = qty;
	  		if(commerces[i].description == undefined)
	  			commerces[i].description = description;
	  		if(commerces[i].category == undefined)
	  			commerces[i].category = category;
	  		if(commerces[i].user == undefined)
	  			commerces[i].user = user;
	  		if(commerces[i].user_id == undefined)
	  			commerces[i].user_id = user_id;
	  		if(commerces[i].image == undefined)
	  			commerces[i].image = image;
	  		return input;
	  	}
	}
}

var createCommerceFunction = function({input}) {
	commerces.push(input);
	return input;
}

var deleteCommerceFunction = function({_id}) {
	var itemId = _id;
  	for(var i = 0; i < commerces.length; i++) {
	  	if(itemId == commerces[i]._id) {
	  		commerces.splice(i, 1);
	  		return commerces[i]._id;
	  	}
	}
}

exports.root = {
	commerce: getCommerce,
	commerces: getCommerces,
	updateCommerce: updateCommerceFunction,
	createCommerce: createCommerceFunction,
	deleteCommerce: deleteCommerceFunction
};