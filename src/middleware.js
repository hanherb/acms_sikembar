<<<<<<< HEAD
const mongodb = require('mongodb');
const mongo = require('./mongo-connect');
const jwt = require('jsonwebtoken');

function getDate() {
	let currentdate = new Date();
	let date = currentdate.getDate();
	const monthNames = ["January", "February", "March", "April", "May", "June",
	  "July", "August", "September", "October", "November", "December"
	];
	let month = monthNames[(currentdate.getMonth())];
	let year = currentdate.getFullYear();
	let second = currentdate.getSeconds();
    let minute = currentdate.getMinutes();
    let hour = currentdate.getHours();
	let dateObj = {
		date: date,
		month: month,
		year: year,
		second: second,
		minute: minute,
		hour: hour
	}
	return dateObj;
}

function getDetail(req, res, path) {
	if(path == '/add-supply') {
		return 'Supplied ' + req.body.qty + ' ' + req.body.medicine;
	}
	else {
		return path.split('-')[0].split('/')[1] + ' ' + path.split('-')[1];
	}
}

function logger(req, res, next) {
	if(req.path.split('-')[0] != '/get' && req.path != '/substract-qty' && req.path != '/item-supplied') {
		let path = req.path;
		let userId = req.headers.user_session;
		let detail = getDetail(req, res, path);

		let dateObj = getDate();
		let fulldate = dateObj.date + " " + dateObj.month + " " + dateObj.year + " @ " + dateObj.hour + ":" + dateObj.minute + ":" + dateObj.second;
		mongo.mongoLogger("insert", {path: path, detail: detail, userId: userId, date: fulldate}, function(response) {
			next();
		});
	}
	else {
		next();
	}
}

function authorityFilter(req, res, next) {
	let userAuthority = req.headers.user_authority.split(",");
	if(req.path.split('-')[0] == '/get') {
		let authorityType = req.path.split('-')[1];

		if(authorityType == 'user') {
			return true;
		}

		if(authorityType == 'plugin') {
			return true;
		}

		if(authorityType == 'role') {
			return true;
		}

		if(authorityType == 'log') {
			return true;
		}

		if(authorityType == 'picture') {
			return true;
		}

		if(authorityType == 'komoditas' ||
			authorityType == 'anggaran' ||
			authorityType == 'arus' ||
			authorityType == 'asumsi' ||
			authorityType == 'harga' ||
			authorityType == 'investasi' ||
			authorityType == 'keuangan' ||
			authorityType == 'laba' ||
			authorityType == 'neraca' ||
			authorityType == 'penerimaan' ||
			authorityType == 'sumber' ||
			authorityType == 'commerce') {
			return true;
		}

		for(let i = 0; i <= userAuthority.length; i++) {
			if(i == userAuthority.length) {
				return false;
			}
			else {
				if(authorityType == userAuthority[i]) {
					return true;
					break;
				}
			}
		}
	}

	else {
		return true;
	}
}

exports.beforeEndPoint = function(req, res, next) {
	if(req.path != '/login-user' && 
		req.path != '/register-user' && 
		req.path != '/post-picture' &&
		req.path != '/get-role' && 
		req.path != '/get-plugin' && 
		req.path != '/get-belanja-barang' && 
		req.path != '/create-user-many' && 
		req.path != '/logout') {
		// console.log("authorization headers: " + req.headers.authorization);
		// console.log("user session headers: " + req.headers.user_session);
		// console.log("authority headers: " + req.headers.user_authority);
		// console.log("headers: " + JSON.stringify(req.headers));
		const bearerHeader = req.headers['authorization'];
		if(typeof bearerHeader !== 'undefined') {
			const bearer = bearerHeader.split(' ');
			const bearerToken = bearer[1];

			req.token = bearerToken;
			jwt.verify(req.token, 'kuda', (err, authData) => {
				if(err) {
					res.sendStatus(403);
				}
				else {
					let authority = authorityFilter(req, res, next);
					if(authority) {
						logger(req, res, next);
					}
					else {
						res.sendStatus(403);
					}
				}
			});
		}
		else {
			res.sendStatus(403);
		}
	}
	else {
		next();
	}
=======
const mongodb = require('mongodb');
const mongo = require('./mongo-connect');
const jwt = require('jsonwebtoken');

function getDate() {
	let currentdate = new Date();
	let date = currentdate.getDate();
	const monthNames = ["January", "February", "March", "April", "May", "June",
	  "July", "August", "September", "October", "November", "December"
	];
	let month = monthNames[(currentdate.getMonth())];
	let year = currentdate.getFullYear();
	let second = currentdate.getSeconds();
    let minute = currentdate.getMinutes();
    let hour = currentdate.getHours();
	let dateObj = {
		date: date,
		month: month,
		year: year,
		second: second,
		minute: minute,
		hour: hour
	}
	return dateObj;
}

function getDetail(req, res, path) {
	if(path == '/add-supply') {
		return 'Supplied ' + req.body.qty + ' ' + req.body.medicine;
	}
	else {
		return path.split('-')[0].split('/')[1] + ' ' + path.split('-')[1];
	}
}

function logger(req, res, next) {
	if(req.path.split('-')[0] != '/get' && req.path != '/substract-qty' && req.path != '/item-supplied') {
		let path = req.path;
		let userId = req.headers.user_session;
		let detail = getDetail(req, res, path);

		let dateObj = getDate();
		let fulldate = dateObj.date + " " + dateObj.month + " " + dateObj.year + " @ " + dateObj.hour + ":" + dateObj.minute + ":" + dateObj.second;
		mongo.mongoLogger("insert", {path: path, detail: detail, userId: userId, date: fulldate}, function(response) {
			next();
		});
	}
	else {
		next();
	}
}

function authorityFilter(req, res, next) {
	let userAuthority = req.headers.user_authority.split(",");
	if(req.path.split('-')[0] == '/get') {
		let authorityType = req.path.split('-')[1];

		if(authorityType == 'user') {
			return true;
		}

		if(authorityType == 'plugin') {
			return true;
		}

		if(authorityType == 'role') {
			return true;
		}

		if(authorityType == 'log') {
			return true;
		}

		if(authorityType == 'picture') {
			return true;
		}

		if(authorityType == 'komoditas' ||
			authorityType == 'anggaran' ||
			authorityType == 'arus' ||
			authorityType == 'asumsi' ||
			authorityType == 'harga' ||
			authorityType == 'investasi' ||
			authorityType == 'keuangan' ||
			authorityType == 'laba' ||
			authorityType == 'neraca' ||
			authorityType == 'penerimaan' ||
			authorityType == 'sumber' ||
			authorityType == 'commerce') {
			return true;
		}

		for(let i = 0; i <= userAuthority.length; i++) {
			if(i == userAuthority.length) {
				return false;
			}
			else {
				if(authorityType == userAuthority[i]) {
					return true;
					break;
				}
			}
		}
	}

	else {
		return true;
	}
}

exports.beforeEndPoint = function(req, res, next) {
	if(req.path != '/login-user' && 
		req.path != '/register-user' && 
		req.path != '/post-picture' &&
		req.path != '/get-role' && 
		req.path != '/get-plugin' && 
		req.path != '/get-belanja-barang' && 
		req.path != '/get-neraca-public' && 
		req.path != '/get-laba-rugi-public' &&
		req.path != '/get-commerce' &&
		req.path != '/get-user-public' &&
		req.path != '/logout') {
		// console.log("authorization headers: " + req.headers.authorization);
		// console.log("user session headers: " + req.headers.user_session);
		// console.log("authority headers: " + req.headers.user_authority);
		// console.log("headers: " + JSON.stringify(req.headers));
		const bearerHeader = req.headers['authorization'];
		if(typeof bearerHeader !== 'undefined') {
			const bearer = bearerHeader.split(' ');
			const bearerToken = bearer[1];

			req.token = bearerToken;
			jwt.verify(req.token, 'kuda', (err, authData) => {
				if(err) {
					res.sendStatus(403);
				}
				else {
					let authority = authorityFilter(req, res, next);
					if(authority) {
						logger(req, res, next);
					}
					else {
						res.sendStatus(403);
					}
				}
			});
		}
		else {
			res.sendStatus(403);
		}
	}
	else {
		next();
	}
>>>>>>> fbaafceba27ecd2235d9a20ce09e925c929c8f69
}