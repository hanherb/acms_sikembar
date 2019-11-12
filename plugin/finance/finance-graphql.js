var mongodb = require('mongodb');
var mongo = require('../../src/mongo-connect');
var {buildSchema} = require('graphql');

exports.schema = buildSchema(`
	type Query {
		balances: [Balances],
		reports: [Reports]
	},

	type Budgets{
        budget_id: ID!
        report_id: ID!
        detail: String!
        value: Int!
        category_id: ID!
    },

    type Budget_categories{
        category_id: ID!
        category_name: String!
    },

	type Currencies{
        currency_id: ID!
        currency_name: String!
    },

	type Cashflows{
        cashflow_id: ID!
        report_id: ID!
        detail: String!
        value: Int!
        category_id: ID!
    },

	type Cashflow_categories{
        category_id: ID!
        category_name: String!
    },

	type Assumptions{
        assumption_id: ID!
        report_id: ID!
        currency_id: ID!
        unit_rate: Int!
        detail: String!
        volume_unit_id: ID!
        volume_value: Int!
        price_value: Int!
        cutoff_grade_value: Int!
        cutoff_grade_unit: String!
    },

	type Volume_units{
        volume_unit_id: ID!
        volume_unit_text: String!
    },

	type Assumption_fuel_prices{
        assumption_fuel_price_id: ID!
        report_id: ID!
        currency_id: ID!
        unit_rate: Int!
        detail: String!
        volume_unit_id: ID!
        volume_value: Int!
    },

	type Costofgoods{
        costofgood_id: ID!
        report_id: ID!
        detail: String!
        value: Int!
        category_id: ID!
    },

	type Cost_of_goods_categories{
        category_id: ID!
        category_name: String!
    },

	type Investments{
        investment_id: ID!
        report_id: ID!
        detail: String!
        value: Int!
    },

	type Other_finances{
        other_finance_id: ID!
        report_id: ID!
        detail: String!
        value: Int!
    },

	type Profit_losses{
        profit_loss_id: ID!
        report_id: ID!
        detail: String!
        value: Int!
    },

	type Royalties{
        royalty_id: ID!
        report_id: ID!
        currency_id: ID!
        unit_rate: Int!
        detail: String!
        volume_unit_id: ID!
        value: Int!
    },

	type Reports{
        report_id: Int!
        user_id: Int!
        year: Int!,
        term: String!
        report_type: String!
        currency: String!
        rate: Int!,
        approved: Int!,
        flagged_for_deletion: Int,
    },

    type Operation_costs{
        operation_cost_id: ID!
        report_id: ID!
        detail: String!
        value: Int!
    },

	type National_incomes{
        profit_loss_id: ID!
        report_id: ID!
        detail: String!
        value: Int!
        category_id: ID!
    },

	type National_income_categories{
        category_id: ID!
        category_name: String!
    },

	type Balances{
        balance_id: Int!
        report_id: Int!
        detail: String!
        value: Int!
        category: String
        sub_category: String
    },

	type Balance_categories{
        category_id: ID!
        category_name: String!
    },

	type Source_of_financings{
        source_of_financing_id: ID!
        report_id: ID!
        detail: String!
        value: Int!
        category_id: ID!
    },

	type Sof_categories{
        category_id: ID!
        category_name: String!
    },

  	type Mutation {
		createBalance(input: BalancesInput): Balances,
		deleteBalance(balance_id: Int!): Balances,
		createReport(input: ReportsInput): Reports,
		deleteReport(report_id: Int!): Reports,
	},

	input BalancesInput{
        balance_id: Int!
        report_id: Int!
        detail: String!
        value: Int!
        category: String
        sub_category: String
    },

    input ReportsInput{
        report_id: Int!
        user_id: Int!
        year: Int!,
        term: String!
        report_type: String!
        currency: String!
        rate: Int!,
        approved: Int!,
        flagged_for_deletion: Int,
    },
`);

var balances = [];
mongo.mongoNeraca("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		balances.push(response[i]);
	}
});

var reports = [];
mongo.mongoReport("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		reports.push(response[i]);
	}
});

var getBalances = function() {
	return balances;
}

var createBalanceFunction = function({input}) {
	balances.push(input);
	return input;
}

var deleteBalanceFunction = function({balance_id}) {
	var balanceId = balance_id;
  	for(var i = 0; i < balances.length; i++) {
	  	if(balanceId == balances[i].balance_id) {
	  		balances.splice(i, 1);
	  		return "deleted";
	  	}
	}
}

var getReports = function() {
	return reports;
}

var createReportFunction = function({input}) {
	reports.push(input);
	return input;
}

var deleteReportFunction = function({report_id}) {
	var reportId = report_id;
  	for(var i = 0; i < reports.length; i++) {
	  	if(reportId == reports[i].report_id) {
	  		reports.splice(i, 1);
	  		return "deleted";
	  	}
	}
}

exports.root = {
	balances: getBalances,
	reports: getReports,
	createBalance: createBalanceFunction,
	deleteBalance: deleteBalanceFunction,
	createReport: createReportFunction,
	deleteReport: deleteReportFunction,
};