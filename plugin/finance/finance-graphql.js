var mongodb = require('mongodb');
var mongo = require('../../src/mongo-connect');
var {buildSchema} = require('graphql');

exports.schema = buildSchema(`
	type Query {
		anggaranBelanja(_id: String!): AnggaranBelanja,
		anggaranBelanjas: [AnggaranBelanja]
	},

	type AnggaranBelanja {
		_id: String,
  		kantor_penghasilan_karyawan: String,
  		kantor_kesejahteraan_karyawan: String,
  		kantor_komisi_penjualan: String,
  		kantor_pemeliharaan_kantor: String,
  		kantor_depresiasi_dan_amortisasi: String,
  		kantor_promosi_dan_publikasi: String,
  		kantor_sewa_alat: String,
  		kantor_pengiriman_barang_perjalanan_dan_komunikasi: String,
  		kantor_konsultan: String,
  		kantor_keuangan: String,
  		kantor_umum_dan_administrasi: String,
  		kantor_pengembangan_masyarakat: String,
  		kantor_biaya_lain_lain: String,
  		site_penghasilan_karyawan: String,
  		site_pemeliharaan_kantor: String,
  		site_pengiriman_barang_perjalanan_dan_komunikasi: String,
  		site_umum_dan_administrasi: String,
  		site_biaya_analisa_mineral_logam: String,
  		site_biaya_lain_lain: String,
  		bangunan: String,
  		sarana_dan_prasarana: String,
  		mesin: String,
  		peralatan: String,
  		kendaraan_dan_angkutan: String,
  		peralatan_eksplorasi: String,
  		kapal: String,
  		alat_alat_perabotan: String,
  		status_dan_tahun: String,
  		upload_by: String,
  		tahapan_kegiatan: String,
  	},

  	type Mutation {
		updateAnggaranBelanja(_id: String!, input: AnggaranBelanjaInput): AnggaranBelanja,
		createAnggaranBelanja(input: AnggaranBelanjaInput): AnggaranBelanja,
		deleteAnggaranBelanja(_id: String!): AnggaranBelanja
	},

	input AnggaranBelanjaInput {
		_id: String,
  		kantor_penghasilan_karyawan: String,
  		kantor_kesejahteraan_karyawan: String,
  		kantor_komisi_penjualan: String,
  		kantor_pemeliharaan_kantor: String,
  		kantor_depresiasi_dan_amortisasi: String,
  		kantor_promosi_dan_publikasi: String,
  		kantor_sewa_alat: String,
  		kantor_pengiriman_barang_perjalanan_dan_komunikasi: String,
  		kantor_konsultan: String,
  		kantor_keuangan: String,
  		kantor_umum_dan_administrasi: String,
  		kantor_pengembangan_masyarakat: String,
  		kantor_biaya_lain_lain: String,
  		site_penghasilan_karyawan: String,
  		site_pemeliharaan_kantor: String,
  		site_pengiriman_barang_perjalanan_dan_komunikasi: String,
  		site_umum_dan_administrasi: String,
  		site_biaya_analisa_mineral_logam: String,
  		site_biaya_lain_lain: String,
  		bangunan: String,
  		sarana_dan_prasarana: String,
  		mesin: String,
  		peralatan: String,
  		kendaraan_dan_angkutan: String,
  		peralatan_eksplorasi: String,
  		kapal: String,
  		alat_alat_perabotan: String,
  		status_dan_tahun: String,
  		upload_date: String,
  		upload_by: String,
  		tahapan_kegiatan: String,
  	}
`);

var anggaranBelanjas = [];
mongo.mongoAnggaranBelanja("find", {}, function(response) {
	for(var i = 0; i < response.length; i++) {
		response[i]._id = response[i]._id.toString();
		anggaranBelanjas.push(response[i]);
	}
});

var getAnggaranBelanja = function(args) {
	var itemId = args._id;
  	for(var i = 0; i < anggaranBelanjas.length; i++) {
	  	if(itemId == anggaranBelanjas[i]._id) {
	  		return anggaranBelanjas[i];
	  	}
	}
}

var getAnggaranBelanjas = function() {
	return anggaranBelanjas;
}

var createAnggaranBelanjaFunction = function({input}) {
	anggaranBelanjas.push(input);
	return input;
}

var deleteAnggaranBelanjaFunction = function({_id}) {
	var itemId = _id;
  	for(var i = 0; i < anggaranBelanjas.length; i++) {
	  	if(itemId == anggaranBelanjas[i]._id) {
	  		anggaranBelanjas.splice(i, 1);
	  		return anggaranBelanjas[i]._id;
	  	}
	}
}

exports.root = {
	anggaranBelanja: getAnggaranBelanja,
	anggaranBelanjas: getAnggaranBelanjas,
	createAnggaranBelanja: createAnggaranBelanjaFunction,
	deleteAnggaranBelanja: deleteAnggaranBelanjaFunction,
};