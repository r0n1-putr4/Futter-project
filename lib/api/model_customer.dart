// To parse this JSON data, do
//
//     final responseModel = responseModelFromJson(jsonString);

import 'dart:convert';

ResponseModel responseModelFromJson(String str) => ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  String status;
  Produk produk;

  ResponseModel({
    required this.status,
    required this.produk,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
    status: json["status"],
    produk: Produk.fromJson(json["produk"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "produk": produk.toJson(),
  };
}

class Produk {
  int id;
  String username;
  String password;
  String nama;
  String alamat;
  String telepon;

  Produk({
    required this.id,
    required this.username,
    required this.password,
    required this.nama,
    required this.alamat,
    required this.telepon,
  });

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
    id: json["id"],
    username: json["username"],
    password: json["password"],
    nama: json["nama"],
    alamat: json["alamat"],
    telepon: json["telepon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "password": password,
    "nama": nama,
    "alamat": alamat,
    "telepon": telepon,
  };
}
