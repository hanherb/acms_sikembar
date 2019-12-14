var mongodb = require('mongodb');
var mongo = require('./mongo-connect');
var {buildSchema} = require('graphql');
var mergeSchema = require('graphql-tools');
var commerceGraphql = require('../plugin/commerce/commerce-graphql');
var financeGraphql = require('../plugin/finance/finance-graphql');
var goodsGraphql = require('../plugin/goods/goods-graphql');

var defaultSchema = buildSchema(`
	type Query {
		user(user_id: Int!): Users,
		users: [Users],
		user_details: [UserDetails],
		logs: [Log],
		roles: [Roles],
		permission(permission_id: ID!): Permissions,
		permissions: [Permissions],
		company_type(company_type_id: ID!): Company_types,
		company_types: [Company_types],
		plugin(name: String!): Plugin,
		plugins: [Plugin],
	},

  	type Log {
  		log_id: Int,
  		path: String,
  		userId: Int,
  		date: String
  	},

  	type Plugin {
  		name: String,
  		status: Int
  	},

  	type Users{
        user_id: Int!
        username: String
        fullname: String
        password: String
        company_type: String
        role: String
    },

    type UserDetails{
    	user_detail_id: Int!
        user_id: Int!
		company_id: String
		company_name: String
		type: String
		company_address: String
		npwp: String
		email: String
		wiup: String
		license_type: String
		license_status: String
		province_code: String
		province: String
		commodity: String
    },

	type Roles{
        role_id: ID!
        role_name: String!
        display_name: String!
    },

	type Permissions{
        permission_id: ID!
        role_id: ID!
        display_name: String!
        can_created_modules: String!
        can_read_modules: String!
        can_update_modules: String!
        can_delete_modules: String!
    },

	type Company_types{
        company_type_id: ID!
        company_type_name: String!
    },

  	type Mutation {
		updateUser(user_id: Int!, input: UsersInput): Users,
		createUser(input: UsersInput): Users,
		deleteUser(user_id: Int!): Users,
		updateUserDetail(user_detail_id: Int!, input: UserDetailsInput): UserDetails,
		createUserDetail(input: UserDetailsInput): UserDetails,
		deleteUserDetail(user_detail_id: Int!): UserDetails,
		createLog(input: LogInput): Log,
		updatePlugin(name: String!, input: PluginInput): Plugin,
		createPlugin(input: PluginInput): Plugin,
		createPermission(input: PermissionsInput): Permissions,
		createCompany_types(input: Company_typesInput): Company_types,
	},

	input UsersInput {
		user_id: Int!
        username: String
        fullname: String
        password: String
        company_type: String
        role: String
  	},

  	input UserDetailsInput{
    	user_detail_id: Int!
        user_id: Int!
		company_id: String
		company_name: String
		type: String
		company_address: String
		npwp: String
		email: String
		wiup: String
		license_type: String
		license_status: String
		province_code: String
		province: String
		commodity: String
    },

  	input LogInput {
  		log_id: Int,
  		path: String,
  		userId: Int,
  		date: String
  	},

  	input PluginInput {
  		name: String,
  		status: Int
  	},

  	input PermissionsInput{
        permission_id: ID!
        role_id: ID!
        display_name: String!
        can_created_modules: String!
        can_read_modules: String!
        can_update_modules: String!
        can_delete_modules: String!
    },

	input Company_typesInput{
        company_type_id: ID!
        company_type_name: String!
    },
`);

var schemas = [];
schemas.push(defaultSchema);
schemas.push(commerceGraphql.schema);
schemas.push(financeGraphql.schema);
schemas.push(goodsGraphql.schema);

exports.schema = mergeSchema.mergeSchemas({
  schemas: schemas
});

var users = [];
mongo.mongoUser("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		users.push(response[i]);
	}
});

var user_details = [];
mongo.mongoUserDetail("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		user_details.push(response[i]);
	}
});

var logs = [];
mongo.mongoLogger("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		logs.push(response[i]);
	}
});

var roles = [];
// mongo.mongoRole("find", {}, function(response) { 
// 	for(var i = 0; i < response.length; i++) {
// 		roles.push(response[i]);
// 	}
// });

var plugins = [];
// mongo.mongoPlugin("find", {}, function(response) {
// 	for(var i = 0; i < response.length; i++) {
// 		plugins.push(response[i]);
// 	}
// });

var getUser = function(args) {
	var userId = args.user_id;
  	for(var i = 0; i < users.length; i++) {
	  	if(userId == users[i].user_id) {
	  		return users[i];
	  	}
	}
}

var getUsers = function() {
	return users;
}

var getUserDetails = function() {
	return user_details;
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

var updateUserFunction = function({user_id, input}) {
	var userId = user_id;
  	for(var i = 0; i < users.length; i++) {
	  	if(userId == users[i].user_id) {
	  		users[i] = input;
	  		return input;
	  	}
	}
}

var createUserFunction = function({input}) {
	users.push(input);
	return input;
}

var deleteUserFunction = function({user_id}) {
	var userId = user_id;
  	for(var i = 0; i < users.length; i++) {
	  	if(userId == users[i].user_id) {
	  		users.splice(i, 1);
	  		return "deleted";
	  	}
	}
}

var updateUserDetailFunction = function({user_detail_id, input}) {
	var userDetailId = user_detail_id;
  	for(var i = 0; i < user_details.length; i++) {
	  	if(userDetailId == user_details[i].user_detail_id) {
	  		user_details[i] = input;
	  		return input;
	  	}
	}
}

var createUserDetailFunction = function({input}) {
	user_details.push(input);
	return input;
}

var deleteUserDetailFunction = function({user_detail_id}) {
	var userDetailId = user_detail_id;
  	for(var i = 0; i < user_details.length; i++) {
	  	if(userDetailId == user_details[i].user_detail_id) {
	  		user_details.splice(i, 1);
	  		return "deleted";
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
	user_details: getUserDetails,
	logs: getLogs,
	roles: getRoles,
	plugin: getPlugin,
	plugins: getPlugins,

	commerce: commerceGraphql.root.commerce,
	commerces: commerceGraphql.root.commerces,

	balances: financeGraphql.root.balances,
	profit_losses: financeGraphql.root.profit_losses,
	national_incomes: financeGraphql.root.national_incomes,
	cashflows: financeGraphql.root.cashflows,
	budgets: financeGraphql.root.budgets,
	costofgoods: financeGraphql.root.costofgoods,
	source_of_financings: financeGraphql.root.source_of_financings,
	investments: financeGraphql.root.investments,
	other_finances: financeGraphql.root.other_finances,
	assumptions: financeGraphql.root.assumptions,
	reports: financeGraphql.root.reports,

	report_procurements: goodsGraphql.root.report_procurements,
	procurements: goodsGraphql.root.procurements,

	updateUser: updateUserFunction,
	createUser: createUserFunction,
	deleteUser: deleteUserFunction,
	updateUserDetail: updateUserDetailFunction,
	createUserDetail: createUserDetailFunction,
	deleteUserDetail: deleteUserDetailFunction,
	createLog: createLogFunction,
	createPlugin: createPluginFunction,
	updatePlugin: updatePluginFunction,

	updateCommerce: commerceGraphql.root.updateCommerce,
	createCommerce: commerceGraphql.root.createCommerce,
	deleteCommerce: commerceGraphql.root.deleteCommerce,

	createBalance: financeGraphql.root.createBalance,
	deleteBalance: financeGraphql.root.deleteBalance,
	createProfitLoss: financeGraphql.root.createProfitLoss,
	deleteProfitLoss: financeGraphql.root.deleteProfitLoss,
	createNationalIncome: financeGraphql.root.createNationalIncome,
	deleteNationalIncome: financeGraphql.root.deleteNationalIncome,
	createCashflow: financeGraphql.root.createCashflow,
	deleteCashflow: financeGraphql.root.deleteCashflow,
	createBudget: financeGraphql.root.createBudget,
	deleteBudget: financeGraphql.root.deleteBudget,
	createCostofgood: financeGraphql.root.createCostofgood,
	deleteCostofgood: financeGraphql.root.deleteCostofgood,
	createSourceOfFinancing: financeGraphql.root.createSourceOfFinancing,
	deleteSourceOfFinancing: financeGraphql.root.deleteSourceOfFinancing,
	createInvestment: financeGraphql.root.createInvestment,
	deleteInvestment: financeGraphql.root.deleteInvestment,
	createOtherFinance: financeGraphql.root.createOtherFinance,
	deleteOtherFinance: financeGraphql.root.deleteOtherFinance,
	createAssumption: financeGraphql.root.createAssumption,
	deleteAssumption: financeGraphql.root.deleteAssumption,
	createReport: financeGraphql.root.createReport,
	updateReport: financeGraphql.root.updateReport,
	deleteReport: financeGraphql.root.deleteReport,

	createReportProcurement: goodsGraphql.root.createReportProcurement,
	deleteReportProcurement: goodsGraphql.root.deleteReportProcurement,
	createProcurement: goodsGraphql.root.createProcurement,
	deleteProcurement: goodsGraphql.root.deleteProcurement,
};