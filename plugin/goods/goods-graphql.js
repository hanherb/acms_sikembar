var mongodb = require('mongodb');
var mongo = require('../../src/mongo-connect');
var {buildSchema} = require('graphql');

exports.schema = buildSchema(`
	type Query {
		report_procurements: [ReportProcurements],
    procurements: [Procurements]
	},

  type ReportProcurements{
      report_procurement_id: Int!
      user_id: Int!
      year: Int!
      term: String!
      report_type: String!
      approved: Int!
      flagged_for_deletion: Int
  },

	type Procurements{
    procurements_id: Int!
    report_procurement_id: Int!
    detail: String!
    specification: String
    unit_price: Int!
    category: String!
    country_of_origin: String
    province_of_origin: String
    district_of_origin: String
    city_of_origin: String
    qty: Int!
    project_area: String
    tkdn: Float!
  },

	type Mutation {
		createReportProcurement(input: ReportProcurementsInput): ReportProcurements,
		deleteReportProcurement(report_procurement_id: Int!): ReportProcurements,
    createProcurement(input: ProcurementsInput): Procurements,
    deleteProcurement(procurements_id: Int!): Procurements
	},

  input ReportProcurementsInput{
      report_procurement_id: Int!
      user_id: Int!
      year: Int!
      term: String!
      report_type: String!
      approved: Int!
      flagged_for_deletion: Int
  },

  input ProcurementsInput{
    procurements_id: Int!
    report_procurement_id: Int!
    detail: String!
    specification: String
    unit_price: Int!
    category: String!
    country_of_origin: String
    province_of_origin: String
    district_of_origin: String
    city_of_origin: String
    qty: Int!
    project_area: String
    tkdn: Float!
  },
`);

var report_procurements = [];
mongo.mongoReportBarang("find", {}, function(response) {
  for(var i = 0; i < response.length; i++) {
    report_procurements.push(response[i]);
  }
});

var procurements = [];
mongo.mongoBelanjaBarang("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		procurements.push(response[i]);
	}
});

var getReportProcurements = function() {
	return report_procurements;
}

var createReportProcurementFunction = function({input}) {
	report_procurements.push(input);
	return input;
}

var deleteReportProcurementFunction = function({report_procurement_id}) {
	var reportProcurementId = report_procurement_id;
	for(var i = 0; i < report_procurements.length; i++) {
  	if(reportProcurementId == report_procurements[i].report_procurement_id) {
  		report_procurements.splice(i, 1);
  		return report_procurements[i].report_procurement_id;
  	}
	}
}

var getProcurements = function() {
  return procurements;
}

var createProcurementFunction = function({input}) {
  procurements.push(input);
  return input;
}

var deleteProcurementFunction = function({procurements_id}) {
  var procurementId = procurements_id;
  for(var i = 0; i < procurements.length; i++) {
    if(procurementId == procurements[i].procurements_id) {
      procurements.splice(i, 1);
      return procurements[i].procurements_id;
    }
  }
}

exports.root = {
	report_procurements: getReportProcurements,
  procurements: getProcurements,
	createReportProcurement: createReportProcurementFunction,
	deleteReportProcurement: deleteReportProcurementFunction,
  createProcurement: createProcurementFunction,
  deleteProcurement: deleteProcurementFunction,
};