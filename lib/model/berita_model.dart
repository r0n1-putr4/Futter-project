// To parse this JSON data, do
//
//     final beritaModel = beritaModelFromJson(jsonString);

import 'dart:convert';

BeritaModel beritaModelFromJson(String str) => BeritaModel.fromJson(json.decode(str));

String beritaModelToJson(BeritaModel data) => json.encode(data.toJson());

class BeritaModel {
  bool success;
  String message;
  List<Datum> data;

  BeritaModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory BeritaModel.fromJson(Map<String, dynamic> json) => BeritaModel(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String judul;
  String isi;
  String tglIndonesiaBerita;
  String gambar;
  double rating;

  Datum({
    required this.id,
    required this.judul,
    required this.isi,
    required this.tglIndonesiaBerita,
    required this.gambar,
    required this.rating,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    judul: json["judul"],
    isi: json["isi"],
    tglIndonesiaBerita: json["tgl_indonesia_berita"],
    gambar: json["gambar"],
    rating: json["rating"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "judul": judul,
    "isi": isi,
    "tgl_indonesia_berita": tglIndonesiaBerita,
    "gambar": gambar,
    "rating": rating,
  };
}
