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
        cb(null, '/home/admin-sikembar/dashboard-esdm/src/assets/images/uploads');
    },
    filename: function(req, file, cb) {
        cb(null, file.originalname + '.png');
    }
});
const upload = multer({storage});

router.route('/').get(function(req, res) {rf.redirectIndex(req, res)});

router.route('/get-user').get(function(req, res) {rf.getUser(req, res)});

router.route('/get-user-public').get(function(req, res) {rf.getUser(req, res)});

router.route('/get-log').get(function(req, res) {rf.getLog(req, res)});

router.route('/import-csv').post(function(req, res) {rf.importCsv(req, res)});

router.route('/register-user').post(function(req, res) {rf.registerUser(req, res)});

router.route('/login-user').post(function(req, res) {rf.loginUser(req, res)});

router.route('/create-user').post(function(req, res) {rf.registerUser(req, res)});

router.route('/update-user').post(function(req, res) {rf.updateUser(req, res)});

router.route('/delete-user').post(function(req, res) {rf.deleteUser(req, res)});

router.route('/post-picture').post(upload.single('profile_picture'), function(req, res) {rf.postPicture(req, res)});

router.route('/post-goods-picture').post(upload.single('goods_picture'), function(req, res) {rf.postGoodsPicture(req, res)});

router.route('/get-role').get(function(req, res) {rf.getRole(req, res)});

router.route('/list-plugin').get(function(req, res) {rf.listPlugin(req, res)});

router.route('/get-plugin').get(function(req, res) {rf.getPlugin(req, res)});

router.route('/add-plugin').post(function(req, res) {rf.addPlugin(req, res)});

router.route('/get-komoditas').get(function(req, res) {rf.getKomoditas(req, res)});

router.route('/add-komoditas').post(function(req, res) {rf.addKomoditas(req, res)});

router.route('/get-asumsi-keuangan').get(function(req, res) {rf.getAsumsiKeuangan(req, res)});

router.route('/add-asumsi-keuangan').post(function(req, res) {rf.addAsumsiKeuangan(req, res)});

router.route('/get-neraca').get(function(req, res) {rf.getNeraca(req, res)});

router.route('/get-neraca-public').get(function(req, res) {rf.getNeraca(req, res)});

router.route('/add-neraca').post(function(req, res) {rf.addNeraca(req, res)});

router.route('/get-laba-rugi').get(function(req, res) {rf.getLabaRugi(req, res)});

router.route('/get-laba-rugi-public').get(function(req, res) {rf.getLabaRugi(req, res)});

router.route('/add-laba-rugi').post(function(req, res) {rf.addLabaRugi(req, res)});

router.route('/get-harga-pokok').get(function(req, res) {rf.getHargaPokok(req, res)});

router.route('/add-harga-pokok').post(function(req, res) {rf.addHargaPokok(req, res)});

router.route('/get-arus-kas').get(function(req, res) {rf.getArusKas(req, res)});

router.route('/add-arus-kas').post(function(req, res) {rf.addArusKas(req, res)});

router.route('/get-investasi').get(function(req, res) {rf.getInvestasi(req, res)});

router.route('/add-investasi').post(function(req, res) {rf.addInvestasi(req, res)});

router.route('/get-penerimaan-negara').get(function(req, res) {rf.getPenerimaanNegara(req, res)});

router.route('/add-penerimaan-negara').post(function(req, res) {rf.addPenerimaanNegara(req, res)});

router.route('/get-keuangan-lainnya').get(function(req, res) {rf.getKeuanganLainnya(req, res)});

router.route('/add-keuangan-lainnya').post(function(req, res) {rf.addKeuanganLainnya(req, res)});

router.route('/get-sumber-pembiayaan').get(function(req, res) {rf.getSumberPembiayaan(req, res)});

router.route('/add-sumber-pembiayaan').post(function(req, res) {rf.addSumberPembiayaan(req, res)});

router.route('/get-anggaran-belanja').get(function(req, res) {rf.getAnggaranBelanja(req, res)});

router.route('/add-anggaran-belanja').post(function(req, res) {rf.addAnggaranBelanja(req, res)});

router.route('/get-belanja-barang').get(function(req, res) {rf.getBelanjaBarang(req, res)});

router.route('/add-belanja-barang').post(function(req, res) {rf.addBelanjaBarang(req, res)});

router.route('/get-commerce').get(function(req, res) {rf.getCommerce(req, res)});

router.route('/add-commerce').post(function(req, res) {rf.addItem(req, res)});

router.route('/update-commerce').post(function(req, res) {rf.updateItem(req, res)});

router.route('/delete-commerce').post(function(req, res) {rf.deleteItem(req, res)});

router.route('/logout').get(function(req, res) {rf.logout(req, res)});

module.exports = router;
