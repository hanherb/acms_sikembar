var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var cookieParser = require('cookie-parser');
var route = require('./route.js');
var mongodb = require('mongodb');
var mongo = require('./src/mongo-connect');
var fs = require('fs');
var express_graphql = require('express-graphql');
var graphvar = require('./src/graphql');
var cors = require('cors');
var middle = require('./src/middleware');

var address = 'http://141.136.47.202';

app.use(cors());

app.use('/graphql', cors(), express_graphql({
	schema: graphvar.schema,
	rootValue: graphvar.root,
	graphiql: true
}));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.use(cookieParser());

app.use(function (req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE, navPlugin');
    res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Access-Control-Allow-Headers, Accept, Authorization');
    res.setHeader('Access-Control-Allow-Credentials', true);
    next();
});

app.all('*', middle.verifyToken);

app.use('/', route);

app.use(express.static(__dirname + '/public',{ redirect : false }));
app.use(express.static(__dirname + '/plugin',{ redirect : false }));

var server = app.listen(3000, function () {
  var port = server.address().port;
	var address = server.address().address;

  	console.log('App listening at port:', address + port);
});