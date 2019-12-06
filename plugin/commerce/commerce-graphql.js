var mongodb = require('mongodb');
var mongo = require('../../src/mongo-connect');
var {buildSchema} = require('graphql');

exports.schema = buildSchema(`
	type Query {
		commerce(commerce_id: Int!): Commerces,
		commerces: [Commerces]
	},

	type Commerces {
		commerce_id: Int,
  		name: String,
  		price: Int,
  		tkdn: Int,
  		qty: Int,
  		description: String,
  		category: String,
  		user_id: Int,
  		image: String
  	},

  	type Mutation {
		updateCommerce(commerce_id: Int!, input: CommercesInput): Commerces,
		createCommerce(input: CommercesInput): Commerces,
		deleteCommerce(commerce_id: Int!): Commerces
	},

	input CommercesInput {
		commerce_id: Int,
  		name: String,
  		price: Int,
  		tkdn: Int,
  		qty: Int,
  		description: String,
  		category: String,
  		user_id: Int,
  		image: String
  	}
`);

var commerces = [];
mongo.mongoCommerce("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		commerces.push(response[i]);
	}
});

var getCommerce = function(commerce_id) {
	var commerceId = args.commerce_id;
  	for(var i = 0; i < commerces.length; i++) {
	  	if(commerceId == commerces[i].commerce_id) {
	  		return commerces[i];
	  	}
	}
}

var getCommerces = function() {
	return commerces;
}

var updateCommerceFunction = function({commerce_id, input}) {
	var commerceId = commerce_id;
  	for(var i = 0; i < commerces.length; i++) {
	  	if(commerceId == commerces[i]._id) {
	  		commerces[i] = inpu;
	  		return input;
	  	}
	}
}

var createCommerceFunction = function({input}) {
	commerces.push(input);
	return input;
}

var deleteCommerceFunction = function({commerce_id}) {
	var commerceId = commerce_id;
  	for(var i = 0; i < commerces.length; i++) {
	  	if(commerceId == commerces[i].commerce_id) {
	  		commerces.splice(i, 1);
	  		return commerces[i].commerce_id;
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