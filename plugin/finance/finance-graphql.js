var mongodb = require('mongodb');
var mongo = require('../../src/mongo-connect');
var {buildSchema} = require('graphql');

exports.schema = buildSchema(`
	type Query {
		balances: [Balances],
		profit_losses: [ProfitLosses],
		national_incomes: [NationalIncomes],
		cashflows: [Cashflows],
		budgets: [Budgets],
		costofgoods: [Costofgoods],
		source_of_financings: [SourceOfFinancings],
		investments: [Investments],
		other_finances: [OtherFinances],
		assumptions: [Assumptions],
		reports: [Reports]
	},

	type Budgets{
        budget_id: Int!
        report_id: Int!
        detail: String!
        value: Int!
        category: String!
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
        cashflow_id: Int!
        report_id: Int!
        detail: String!
        value: Int!
        category: String!
    },

	type Cashflow_categories{
        category_id: ID!
        category_name: String!
    },

	type Assumptions{
        assumption_id: Int!
        report_id: Int!
        currency: String!
        unit_rate: Int!
        detail: String!
        volume_unit: String!
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
        costofgood_id: Int!
        report_id: Int!
        detail: String!
        value: Int!
    },

	type Cost_of_goods_categories{
        category_id: ID!
        category_name: String!
    },

	type Investments{
        investment_id: Int!
        report_id: Int!
        detail: String!
        value: Int!
    },

	type OtherFinances{
        other_finance_id: Int!
        report_id: Int!
        detail: String!
        value: Int!
    },

	type ProfitLosses{
        profit_loss_id: Int!
        report_id: Int!
        detail: String!
        value: Int!
        category: String!
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

	type NationalIncomes{
        national_income_id: Int!
        report_id: Int!
        detail: String!
        value: Int!
        category: String!
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

	type SourceOfFinancings{
        source_of_financing_id: Int!
        report_id: Int!
        detail: String!
        value: Int!
    },

	type Sof_categories{
        category_id: ID!
        category_name: String!
    },

  	type Mutation {
		createBalance(input: BalancesInput): Balances,
		deleteBalance(balance_id: Int!): Balances,
		createProfitLoss(input: ProfitLossesInput): ProfitLosses,
		deleteProfitLoss(profit_loss_id: Int!): ProfitLosses,
		createNationalIncome(input: NationalIncomesInput): NationalIncomes,
		deleteNationalIncome(national_income_id: Int!): NationalIncomes,
		createCashflow(input: CashflowsInput): Cashflows,
		deleteCashflow(cashflow_id: Int!): Cashflows,
		createBudget(input: BudgetsInput): Budgets,
		deleteBudget(budget_id: Int!): Budgets,
		createCostofgood(input: CostofgoodsInput): Costofgoods,
		deleteCostofgood(costofgood_id: Int!): Costofgoods,
		createSourceOfFinancing(input: SourceOfFinancingsInput): SourceOfFinancings,
		deleteSourceOfFinancing(source_of_financing_id: Int!): SourceOfFinancings,
		createInvestment(input: InvestmentsInput): Investments,
		deleteInvestment(investment_id: Int!): Investments,
		createOtherFinance(input: OtherFinancesInput): OtherFinances,
		deleteOtherFinance(other_finance_id: Int!): OtherFinances,
		createAssumption(input: AssumptionsInput): Assumptions,
		deleteAssumption(assumption_id: Int!): Assumptions,
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

    input ProfitLossesInput{
        profit_loss_id: Int!
        report_id: Int!
        detail: String!
        value: Int!
        category: String!
    },

    input NationalIncomesInput{
        national_income_id: Int!
        report_id: Int!
        detail: String!
        value: Int!
        category: String!
    },

    input CashflowsInput{
        cashflow_id: Int!
        report_id: Int!
        detail: String!
        value: Int!
        category: String!
    },

    input BudgetsInput{
        budget_id: Int!
        report_id: Int!
        detail: String!
        value: Int!
        category: String!
    },

    input CostofgoodsInput{
        costofgood_id: Int!
        report_id: Int!
        detail: String!
        value: Int!
    },

    input SourceOfFinancingsInput{
        source_of_financing_id: Int!
        report_id: Int!
        detail: String!
        value: Int!
    },

    input InvestmentsInput{
        investment_id: Int!
        report_id: Int!
        detail: String!
        value: Int!
    },

    input OtherFinancesInput{
        other_finance_id: Int!
        report_id: Int!
        detail: String!
        value: Int!
    },

    input AssumptionsInput{
        assumption_id: Int!
        report_id: Int!
        currency: String!
        unit_rate: Int!
        detail: String!
        volume_unit: String!
        volume_value: Int!
        price_value: Int!
        cutoff_grade_value: Int!
        cutoff_grade_unit: String!
    },

    input ReportsInput{
        report_id: Int!
        user_id: Int!
        year: Int!
        term: String!
        report_type: String!
        currency: String!
        rate: Int!
        approved: Int!
        flagged_for_deletion: Int
    },
`);

var balances = [];
mongo.mongoNeraca("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		balances.push(response[i]);
	}
});

var profit_losses = [];
mongo.mongoLabaRugi("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		profit_losses.push(response[i]);
	}
});

var national_incomes = [];
mongo.mongoPenerimaanNegara("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		national_incomes.push(response[i]);
	}
});

var cashflows = [];
mongo.mongoArusKas("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		cashflows.push(response[i]);
	}
});

var budgets = [];
mongo.mongoAnggaranBelanja("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		budgets.push(response[i]);
	}
});

var costofgoods = [];
mongo.mongoHargaPokok("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		costofgoods.push(response[i]);
	}
});

var source_of_financings = [];
mongo.mongoSumberPembiayaan("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		source_of_financings.push(response[i]);
	}
});

var investments = [];
mongo.mongoInvestasi("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		investments.push(response[i]);
	}
});

var other_finances = [];
mongo.mongoKeuanganLainnya("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		other_finances.push(response[i]);
	}
});

var assumptions = [];
mongo.mongoAsumsiKeuangan("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		assumptions.push(response[i]);
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

var getProfitLosses = function() {
	return profit_losses;
}

var createProfitLossFunction = function({input}) {
	profit_losses.push(input);
	return input;
}

var deleteProfitLossFunction = function({profit_loss_id}) {
	var profitLossId = profit_loss_id;
  	for(var i = 0; i < profit_losses.length; i++) {
	  	if(profitLossId == profit_losses[i].profit_loss_id) {
	  		profit_losses.splice(i, 1);
	  		return "deleted";
	  	}
	}
}

var getNationalIncomes = function() {
	return national_incomes;
}

var createNationalIncomeFunction = function({input}) {
	national_incomes.push(input);
	return input;
}

var deleteNationalIncomeFunction = function({national_income_id}) {
	var nationalIncomeId = national_income_id;
  	for(var i = 0; i < national_incomes.length; i++) {
	  	if(nationalIncomeId == national_incomes[i].national_income_id) {
	  		national_incomes.splice(i, 1);
	  		return "deleted";
	  	}
	}
}

var getCashflows = function() {
	return cashflows;
}

var createCashflowFunction = function({input}) {
	cashflows.push(input);
	return input;
}

var deleteCashflowFunction = function({cashflow_id}) {
	var cashflowId = cashflow_id;
  	for(var i = 0; i < cashflows.length; i++) {
	  	if(cashflowId == cashflows[i].cashflow_id) {
	  		cashflows.splice(i, 1);
	  		return "deleted";
	  	}
	}
}

var getBudgets = function() {
	return budgets;
}

var createBudgetFunction = function({input}) {
	budgets.push(input);
	return input;
}

var deleteBudgetFunction = function({budget_id}) {
	var budgetId = budget_id;
  	for(var i = 0; i < budgets.length; i++) {
	  	if(budgetId == budgets[i].budget_id) {
	  		budgets.splice(i, 1);
	  		return "deleted";
	  	}
	}
}

var getCostofgoods = function() {
	return costofgoods;
}

var createCostofgoodFunction = function({input}) {
	costofgoods.push(input);
	return input;
}

var deleteCostofgoodFunction = function({costofgood_id}) {
	var costofgoodId = costofgood_id;
  	for(var i = 0; i < costofgoods.length; i++) {
	  	if(costofgoodId == costofgoods[i].costofgood_id) {
	  		costofgoods.splice(i, 1);
	  		return "deleted";
	  	}
	}
}

var getSourceOfFinancings = function() {
	return source_of_financings;
}

var createSourceOfFinancingFunction = function({input}) {
	source_of_financings.push(input);
	return input;
}

var deleteSourceOfFinancingFunction = function({source_of_financing_id}) {
	var sourceOfFinancingId = source_of_financing_id;
  	for(var i = 0; i < source_of_financings.length; i++) {
	  	if(sourceOfFinancingId == source_of_financings[i].source_of_financing_id) {
	  		source_of_financings.splice(i, 1);
	  		return "deleted";
	  	}
	}
}

var getInvestments = function() {
	return investments;
}

var createInvestmentFunction = function({input}) {
	investments.push(input);
	return input;
}

var deleteInvestmentFunction = function({investment_id}) {
	var investmentId = investment_id;
  	for(var i = 0; i < investments.length; i++) {
	  	if(investmentId == investments[i].investment_id) {
	  		investments.splice(i, 1);
	  		return "deleted";
	  	}
	}
}

var getOtherFinances = function() {
	return other_finances;
}

var createOtherFinanceFunction = function({input}) {
	other_finances.push(input);
	return input;
}

var deleteOtherFinanceFunction = function({other_finance_id}) {
	var otherFinanceId = other_finance_id;
  	for(var i = 0; i < other_finances.length; i++) {
	  	if(otherFinanceId == other_finances[i].other_finance_id) {
	  		other_finances.splice(i, 1);
	  		return "deleted";
	  	}
	}
}

var getAssumptions = function() {
	return assumptions;
}

var createAssumptionFunction = function({input}) {
	assumptions.push(input);
	return input;
}

var deleteAssumptionFunction = function({assumption_id}) {
	var assumptionId = assumption_id;
  	for(var i = 0; i < assumptions.length; i++) {
	  	if(assumptionId == assumptions[i].assumption_id) {
	  		assumptions.splice(i, 1);
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
	profit_losses: getProfitLosses,
	national_incomes: getNationalIncomes,
	cashflows: getCashflows,
	budgets: getBudgets,
	costofgoods: getCostofgoods,
	source_of_financings: getSourceOfFinancings,
	investments: getInvestments,
	other_finances: getOtherFinances,
	assumptions: getAssumptions,
	reports: getReports,
	createBalance: createBalanceFunction,
	deleteBalance: deleteBalanceFunction,
	createProfitLoss: createProfitLossFunction,
	deleteProfitLoss: deleteProfitLossFunction,
	createNationalIncome: createNationalIncomeFunction,
	deleteNationalIncome: deleteNationalIncomeFunction,
	createCashflow: createCashflowFunction,
	deleteCashflow: deleteCashflowFunction,
	createBudget: createBudgetFunction,
	deleteBudget: deleteBudgetFunction,
	createCostofgood: createCostofgoodFunction,
	deleteCostofgood: deleteCostofgoodFunction,
	createSourceOfFinancing: createSourceOfFinancingFunction,
	deleteSourceOfFinancing: deleteSourceOfFinancingFunction,
	createInvestment: createInvestmentFunction,
	deleteInvestment: deleteInvestmentFunction,
	createOtherFinance: createOtherFinanceFunction,
	deleteOtherFinance: deleteOtherFinanceFunction,
	createAssumption: createAssumptionFunction,
	deleteAssumption: deleteAssumptionFunction,
	createReport: createReportFunction,
	deleteReport: deleteReportFunction,
};