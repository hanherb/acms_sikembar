const express = require('express');
const app = express();
const jwt = require('jsonwebtoken');
const mongodb = require('mongodb');
const mongo = require('./src/mongo-connect');
const rf = require('./src/route-function');
const multer = require('multer');
const router = express.Router();

const storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, '/root/dashboard-esdm/src/assets/images/uploads');
    },
    filename: function(req, file, cb) {
        cb(null, file.originalname + '.png');
    }
});
const upload = multer({storage});

router.route('/').get(function(req, res) {rf.redirectIndex(req, res)});

router.route('/get-user').get(function(req, res) {rf.getUser(req, res)});

router.route('/get-log').get(function(req, res) {rf.getLog(req, res)});

router.route('/import-csv').post(function(req, res) {rf.importCsv(req, res)});

router.route('/register-user').post(function(req, res) {rf.registerUser(req, res)});

router.route('/login-user').post(function(req, res) {rf.loginUser(req, res)});

router.route('/create-user').post(function(req, res) {rf.registerUser(req, res)});

router.route('/update-user').post(function(req, res) {rf.updateUser(req, res)});

router.route('/delete-user').post(function(req, res) {rf.deleteUser(req, res)});

router.route('/post-picture').post(upload.single('profile_picture'), function(req, res) {rf.postPicture(req, res)});

router.route('/get-role').get(function(req, res) {rf.getRole(req, res)});

router.route('/list-plugin').get(function(req, res) {rf.listPlugin(req, res)});

router.route('/get-plugin').get(function(req, res) {rf.getPlugin(req, res)});

router.route('/add-plugin').post(function(req, res) {rf.addPlugin(req, res)});

router.route('/logout').get(function(req, res) {rf.logout(req, res)});

module.exports = router;